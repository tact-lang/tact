const mainConfig = require("./jest.config");

const exclude =
    process.env.RUNNER_OS === "macOS"
        ? ["src/test/e2e-emulated/map-tests/build/*"] // due to limited resources we do not want to run e2e tests for the maps
        : [];

module.exports = {
    ...mainConfig,
    exclude,
    maxWorkers: "2",
};
