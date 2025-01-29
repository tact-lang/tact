import { ABIError } from "@ton/core";
import { Maybe } from "@ton/core/dist/utils/maybe";

export function findErrorCodeByMessage(
    errors:
        | Maybe<{
              [key: number]: ABIError;
          }>
        | undefined,
    errorMessage: string,
) {
    if (!errors) return null;
    for (const [code, error] of Object.entries(errors)) {
        if (error.message === errorMessage) {
            return parseInt(code, 10);
        }
    }
    return null;
}
