import { toSnakeCase, toPascalCase } from "./change-case";

describe("toSnakeCase", () => {
    it("should convert camelCase to snake_case", () => {
        expect(toSnakeCase("helloWorld")).toBe("hello_world");
        expect(toSnakeCase("userFirstName")).toBe("user_first_name");
    });

    it("should handle consecutive capital letters (acronyms)", () => {
        expect(toSnakeCase("APIKey")).toBe("api_key");
        expect(toSnakeCase("JSONParser")).toBe("json_parser");
    });

    it("should handle numbers in the string", () => {
        expect(toSnakeCase("user123Name")).toBe("user_123_name");
        expect(toSnakeCase("api2Key")).toBe("api_2_key");
        expect(toSnakeCase("123userName")).toBe("123_user_name");
    });

    it("should handle different separators", () => {
        expect(toSnakeCase("hello-world")).toBe("hello_world");
        expect(toSnakeCase("hello   world")).toBe("hello_world");
        expect(toSnakeCase("hello_world")).toBe("hello_world");
    });

    it("should handle mixed case input", () => {
        expect(toSnakeCase("HelloWorld")).toBe("hello_world");
        expect(toSnakeCase("HELLO_WORLD")).toBe("hello_world");
    });

    it("should handle empty string and edge cases", () => {
        expect(toSnakeCase("")).toBe("");
        expect(toSnakeCase("   ")).toBe("");
        expect(toSnakeCase("---")).toBe("");
        expect(toSnakeCase("___")).toBe("");
    });
});

describe("toPascalCase", () => {
    it("should convert snake_case to PascalCase", () => {
        expect(toPascalCase("hello_world")).toBe("HelloWorld");
        expect(toPascalCase("user_first_name")).toBe("UserFirstName");
    });

    it("should handle consecutive capital letters (acronyms)", () => {
        expect(toPascalCase("api_key")).toBe("ApiKey");
        expect(toPascalCase("json_parser")).toBe("JsonParser");
        expect(toPascalCase("xml_http_request")).toBe("XmlHttpRequest");
    });

    it("should handle numbers in the string", () => {
        expect(toPascalCase("user123name")).toBe("User123name");
        expect(toPascalCase("api2key")).toBe("Api2key");
        expect(toPascalCase("123username")).toBe("123username");
    });

    it("should handle different separators", () => {
        expect(toPascalCase("hello-world")).toBe("HelloWorld");
        expect(toPascalCase("hello   world")).toBe("HelloWorld");
        expect(toPascalCase("hello_world")).toBe("HelloWorld");
    });

    it("should handle mixed case input", () => {
        expect(toPascalCase("helloWorld")).toBe("HelloWorld");
        expect(toPascalCase("HELLO_WORLD")).toBe("HelloWorld");
    });

    it("should handle empty string and edge cases", () => {
        expect(toPascalCase("")).toBe("");
        expect(toPascalCase("   ")).toBe("");
        expect(toPascalCase("---")).toBe("");
        expect(toPascalCase("___")).toBe("");
    });

    it("should preserve existing PascalCase", () => {
        expect(toPascalCase("HelloWorld")).toBe("HelloWorld");
        expect(toPascalCase("UserFirstName")).toBe("UserFirstName");
    });
});
