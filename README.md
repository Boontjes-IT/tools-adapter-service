# Boontjes-IT Tools Adapter Service

The Boontjes-IT Tools Adapter Service is a powerful tool designed to facilitate the quick debugging of WSO2 code. With the help of various APIs and proxies, this adapter enables developers to streamline their debugging process and gain valuable insights into how the enterprise integrator processes messages. Currently, the service provides three proxies:

## ToolsAdapter-beautifyxml_v1_0

The `ToolsAdapter-beautifyxml_v1_0` proxy allows you to beautify an XML message using an XSLT transformation. By leveraging this proxy, you can easily format and enhance the readability of big XML messages, making them more accessible for debugging and analysis.

## ToolsAdapter-json2xml_v1_0

The `ToolsAdapter-json2xml_v1_0` proxy enables you to convert a JSON message to XML using the built-in Saxon parser provided by WSO2. This conversion allows you to examine how the Enterprise Integrator processes messages and gain a deeper understanding of the underlying transformations.

## ToolsAdapter-xml2json_v1_0

The `ToolsAdapter-xml2json_v1_0` proxy facilitates the conversion of an XML message to JSON format using the WSO2 integrated Saxon parser. This conversion provides you with precise insights into how the Enterprise Integrator processes messages and enables you to analyze the data in a JSON-based structure.

## ToolsAdapter-xpathtester_v1_0
The `ToolsAdapter-xpathtester_v1_0` proxy is a handy tool for testing XPath expressions on XML messages. By making API calls to this proxy, you can evaluate and validate XPath queries against XML content, helping you extract specific data from XML messages and verify their correctness.

## ToolsAdapter-genfilename_v1_0

The `ToolsAdapter-genfilename_v1_0` proxy is a function that generates a special filename with version and correct format. It can be used to apply naming format so it will always be the same.

## ToolsAdapter-convertcase_v1_0

The `ToolsAdapter-convertcase_v1_0` proxy provides various case conversion functionalities, including converting to lowercase, uppercase, camel case, pascal case, snake case, title case, and alternating case. It allows you to transform the case of string in one call to all diferrent formats.


## Usage Instructions

To utilize the Boontjes-IT Tools Adapter Service, follow these steps:

1. Ensure that you have the necessary credentials and access rights to interact with the service.
2. Make the appropriate API calls to the desired proxy endpoint, providing the required input message.
3. Retrieve the transformed message or any other relevant output for debugging and analysis purposes.
4. Analyze the processed message to gain insights into how the WSO2 code behaves and identify any potential issues or optimizations.

Please note that the service is actively maintained and may include additional proxies and features in the future. Stay tuned for updates and enhancements!

For any inquiries or support requests, please contact Boontjes-IT at `info@boontjes-it.nl`.

We hope you find the Boontjes-IT Tools Adapter Service valuable to increase your WSO2 development speed!
