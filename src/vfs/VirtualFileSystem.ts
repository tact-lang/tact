export type VirtualFileSystem = {
    root: string;
    resolve(...path: string[]): string;
    exits(path: string): boolean;
    readFile(path: string): Buffer;
    writeFile(path: string, content: Buffer | string): void;
}