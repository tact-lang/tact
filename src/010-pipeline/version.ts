const version = require("../../package.json").version;

let __DANGER__VersionNumberDisabled = false;

export function __DANGER__disableVersionNumber() {
    __DANGER__VersionNumberDisabled = true;
}

export function getCompilerVersion() {
    if (__DANGER__VersionNumberDisabled) {
        return "invalid";
    }
    return version as string;
}
