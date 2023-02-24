export type VirtualFileSystem = {
    resolve(...path: string[]): string;
    readFile(path: string): Buffer | null;
    writeFile(path: string, data: Buffer | string): void;
};