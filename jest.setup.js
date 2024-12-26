// eslint-disable-next-line @typescript-eslint/no-var-requires
const coverage = require("@tact-lang/coverage");
const fc = require("fast-check");

module.exports = async () => {
    if (process.env.COVERAGE === "true") {
        coverage.beginCoverage();
    }
};

function sanitizeObject(
    obj,
    options = {
        excludeKeys: [],
        valueTransformers: {},
    },
) {
    const { excludeKeys, valueTransformers } = options;

    if (Array.isArray(obj)) {
        return obj.map((item) => sanitizeObject(item, options));
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
            const sanitizedCounterexample = sanitizeObject(log.counterexample, {
                excludeKeys: ["id", "loc"],
                valueTransformers: {
                    value: (val) =>
                        typeof val === "bigint" ? val.toString() : val,
                },
            });

            const errorMessage = `
      Property failed after ${log.numRuns} tests
      Seed: ${log.seed}
      Path: ${log.counterexamplePath}
      Counterexample: ${JSON.stringify(sanitizedCounterexample, null, 0)}
      Errors: ${log.error ? log.error : "Unknown error"}
            `;

            throw new Error(errorMessage);
        }
    },
});
