// ts-ignore is used on purpose here (instead of installing @types/node or similar)
// because the whole package must not depend on any node code
// however, this function is required to fix compilation on windows
export function posixNormalize(path: string): string {
    // @ts-ignore
    if (typeof global === 'object' && typeof global.process === 'object' && typeof global.process.versions === 'object' && global.process.versions.node) {
        // @ts-ignore
        const pathModule = require('node:path');
        let normalized_path = path.split(pathModule.sep).join(pathModule.posix.sep);
        return normalized_path;
    }
    return path;
}
