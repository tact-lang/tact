export type Effects = {
    readonly returnOrThrow: boolean;
    readonly setSelfPaths: ReadonlySet<string>;
};
