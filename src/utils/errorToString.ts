export function errorToString(src: unknown): string {
    if (src instanceof Error) {
        return src.stack || src.message;
    } else {
        return "" + src;
    }
}
