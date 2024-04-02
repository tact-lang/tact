import pathModule from "node:path";

export function posixNormalize(path: string): string {
    if (
        typeof global === "object" &&
        typeof global.process === "object" &&
        typeof global.process.versions === "object" &&
        global.process.versions.node
    ) {
        return path.split(pathModule.sep).join(pathModule.posix.sep);
    }
    return path;
}
