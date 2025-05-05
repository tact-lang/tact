import * as allure from "allure-js-commons";
import type {ParameterOptions} from "allure-js-commons/dist/types/model";

export async function step<T>(name: string, body: (context: allure.StepContext) => (PromiseLike<T> | T)) {
    return allure.step(name, body);
}

export async function parameter(name: string, value: string, options?: ParameterOptions): Promise<void> {
    return allure.parameter(name, value, options);
}
