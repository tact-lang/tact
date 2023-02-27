export function errorToString(src: any): string {
    if (src instanceof Error) {
        return src.stack || src.message;
    } else {
        return '' + src;
    }
}