export function errorToString(src: unknown): string {
    if (src instanceof Error) {
        return src.stack || src.message;
    } else {
        // eslint-disable-next-line @typescript-eslint/restrict-template-expressions
        return `${src}`;
    }
}
