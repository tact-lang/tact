export type VirtualFileSystem = {
    resolve(...path: string[]): string;
    exists(path: string): boolean;
    readFile(path: string): Buffer;
    writeFile(path: string, data: Buffer | string): void;
};