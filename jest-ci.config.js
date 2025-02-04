const mainConfig = require("./jest.config");

module.exports = {
    ...mainConfig,
    maxWorkers: "2",
};
