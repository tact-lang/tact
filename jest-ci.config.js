const mainConfig = require("./jest.config");

const testPathIgnorePatterns =
    process.env.RUNNER_OS === "macOS" // due to limited resources we do not want to run e2e tests for the maps
        ? [
              ...(mainConfig.testPathIgnorePatterns || []),
              "src/test/e2e-emulated/map-tests/build/*",
              "src/test/e2e-emulated/getters.spec.ts",
          ]
        : mainConfig.testPathIgnorePatterns;

module.exports = {
    ...mainConfig,
    testPathIgnorePatterns,
    maxWorkers: "2",
};
