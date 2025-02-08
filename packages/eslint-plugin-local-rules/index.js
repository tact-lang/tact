const { name, version } = require("./package.json");
module.exports = {
    meta: {
        name: name,
        version: version,
    },
    rules: {
        "no-export-symbol": require("./rules/no-export-symbol"),
    },
};
