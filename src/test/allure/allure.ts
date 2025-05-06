import * as allure from "allure-js-commons";

/**
 * Executes a step with a given name and body, tracking its execution within Allure reporting.
 *
 * @param {string} name - The name of the step to be recorded in Allure.
 * @param {() => Promise<T>} body - A function that contains the logic to be executed as part of the step.
 * @return {Promise<T>} The result of the step's execution wrapped in a promise.
 */
export async function step<T>(
    name: string,
    body: () => Promise<T>,
): Promise<T> {
    return await allure.step(name, async () => {
        return await body();
    });
}

/**
 * Sets a parameter for the test case with a given name, value, and optional configuration.
 *
 * @param {string} name - The name of the parameter to set.
 * @param {string} value - The value of the parameter to associate with the specified name.
 * @param {allure.ParameterOptions} [options] - Optional configuration for the parameter, allowing additional settings.
 * @return {Promise<void>} A promise that resolves when the parameter is successfully set.
 */
export async function parameter(
    name: string,
    value: string,
    options?: allure.ParameterOptions,
): Promise<void> {
    return allure.parameter(name, value, options);
}

/**
 * Attaches a file or content to the current Allure report.
 *
 * @param name The name of the attachment.
 * @param content The content or data to be attached.
 * @param options The content type of the attachment, such as TEXT, HTML, or JSON.
 * @return A promise-like object that resolves when the attachment is successfully added.
 */
export function attachment(
    name: string,
    content: string,
    options: allure.ContentType,
): PromiseLike<void> {
    return allure.attachment(name, content, options);
}
