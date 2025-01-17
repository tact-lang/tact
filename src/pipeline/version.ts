const version = require("../../package.json").version;

export function getCompilerVersion() {
    return version as string;
}
