import fc from "fast-check";

import { serializer } from "./serializers";
import { expect } from "@jest/globals";

expect.addSnapshotSerializer(serializer);

function sanitizeObject(
    obj: object,
    options: {
        excludeKeys: string[];
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        valueTransformers: Record<string, any>;
    } = {
        excludeKeys: [],
        valueTransformers: {},
    },
) {
    const { excludeKeys, valueTransformers } = options;

    if (Array.isArray(obj)) {
        return obj.map((item) => sanitizeObject(item, options));
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
    } else if (obj !== null && typeof obj === "object") {
        const newObj = {};
        for (const [key, value] of Object.entries(obj)) {
            if (!excludeKeys.includes(key)) {
                const transformer = valueTransformers[key];
                newObj[key] = transformer
                    ? transformer(value)
                    : sanitizeObject(value, options);
            }
        }
        return newObj;
    }
    return obj;
}

fc.configureGlobal({
    reporter: (log) => {
        if (log.failed) {
            // @ts-expect-error -- 1
            const sanitizedCounterexample = sanitizeObject(log.counterexample, {
                excludeKeys: ["id", "loc"],
                valueTransformers: {
                    value: (val) =>
                        typeof val === "bigint" ? val.toString() : val,
                },
            });

            // @ts-expect-error -- 1
            const error = log.error ? log.error : "Unknown error";

            const errorMessage = `
      Property failed after ${log.numRuns} tests
      Seed: ${log.seed}
      Path: ${log.counterexamplePath}
      Counterexample: ${JSON.stringify(sanitizedCounterexample, null, 0)}
      Errors: ${error}
            `;

            throw new Error(errorMessage);
        }
    },
});
