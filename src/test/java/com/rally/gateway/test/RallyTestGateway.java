package com.rally.gateway.test;

import java.io.IOException;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.rallydev.rest.RallyRestApi;
import com.rallydev.rest.request.CreateRequest;
import com.rallydev.rest.request.QueryRequest;
import com.rallydev.rest.response.CreateResponse;
import com.rallydev.rest.response.QueryResponse;
import com.rallydev.rest.util.Fetch;
import com.rallydev.rest.util.QueryFilter;

/**
 * 
 * @author kkale
 *
 */
public class RallyTestGateway {

	static RallyRestApi restApi;

	public static void recordTestResult(String testCaseId, String build,
			String verdict) {
		try {
			if (restApi == null) {
				restApi = RestApiFactory.getRestApi();
			}
			String objectID = "";
			QueryRequest testCase = new QueryRequest("testcase");

			testCase.setFetch(new Fetch("FormattedID", "Name", "ObjectID"));
			testCase.setQueryFilter(new QueryFilter("FormattedID", "=",
					testCaseId));

			QueryResponse queryResponse = restApi.query(testCase);
			if (queryResponse.wasSuccessful()) {
				System.out.println(String.format("\nTotal results: %d",
						queryResponse.getTotalResultCount()));
				System.out.println("Top 5:");
				for (JsonElement result : queryResponse.getResults()) {
					JsonObject defect = result.getAsJsonObject();
					System.out.println(String.format("\t%s - %s: ObjectID=%s",
							defect.get("FormattedID").getAsString(), defect
									.get("Name").getAsString(),
							defect.get("ObjectID").getAsString()));
					objectID = defect.get("ObjectID").getAsString();
				}

				JsonObject newTestResult = new JsonObject();
				newTestResult.addProperty("Build", build);
				newTestResult.addProperty("Verdict", verdict);
				newTestResult.addProperty("TestCase", objectID);

				SimpleDateFormat format = new SimpleDateFormat(
						"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
				newTestResult.addProperty("Date", format.format(new Date()));

				CreateRequest createRequest = new CreateRequest(
						"testcaseresult", newTestResult);
				CreateResponse createResponse = restApi.create(createRequest);

				for (String warning : createResponse.getWarnings()) {
					System.out.println("Warning: " + warning);
				}
				for (String error : createResponse.getErrors()) {
					System.out.println("Error: " + error);
				}

				System.out.println(String.format("Created %s", createResponse
						.getObject().get("_ref").getAsString()));

			} else {
			}

		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		recordTestResult("TC1", "1.5", "Pass");
	}

}
