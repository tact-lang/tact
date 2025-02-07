const mainConfig = require("./jest.config");

const testPathIgnorePatterns =
    process.platform === "darwin" // due to limited resources we do not want to run e2e tests for the maps
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
