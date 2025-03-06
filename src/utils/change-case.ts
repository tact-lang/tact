/**
 * Converts a string to snake_case format
 * Examples:
 * - "helloWorld" -> "hello_world"
 * - "APIKey" -> "api_key"
 * - "user123Name" -> "user_123_name"
 * - "hello-world" -> "hello_world"
 * - "Hello   World" -> "hello_world"
 */
export function toSnakeCase(str: string): string {
    return (
        str
            // Handle consecutive capital letters (e.g., API -> api)
            .replace(/([A-Z]+)([A-Z][a-z])/g, "$1_$2")
            // Handle capital letters followed by lowercase
            .replace(/([a-z])([A-Z])/g, "$1_$2")
            // Handle numbers
            .replace(/([a-z])([0-9])/g, "$1_$2")
            .replace(/([0-9])([a-z])/g, "$1_$2")
            // Convert to lowercase and replace any non-alphanumeric chars with underscore
            .toLowerCase()
            .replace(/[^a-z0-9]+/g, "_")
            // Remove leading/trailing underscores
            .replace(/^_+|_+$/g, "")
    );
}

/**
 * Converts a string to PascalCase format
 * Examples:
 * - "hello_world" -> "HelloWorld"
 * - "api-key" -> "ApiKey"
 * - "user123name" -> "User123name"
 * - "hello   world" -> "HelloWorld"
 * - "APIKey" -> "ApiKey"
 */
export function toPascalCase(str: string): string {
    return (
        str
            // Handle consecutive capital letters (e.g., API -> Api)
            .replace(
                /([A-Z]+)([A-Z][a-z])/g,
                (_, p1, p2) =>
                    p1.charAt(0).toUpperCase() + p1.slice(1).toLowerCase() + p2,
            )
            // Split by any non-alphanumeric characters
            .split(/[^a-zA-Z0-9]+/)
            .map((word) => {
                // Handle empty strings
                if (!word) return "";
                // Handle numbers at the start of words
                if (/^[0-9]/.test(word)) {
                    return word.charAt(0).toUpperCase() + word.slice(1);
                }
                // Handle regular words
                return (
                    word.charAt(0).toUpperCase() + word.slice(1).toLowerCase()
                );
            })
            .join("")
    );
}
