export const CliErrors = (
    log: (error: string) => void
) => {
    return {
        argumentHasParameter: (param: string, argName: string) => {
            log(`Expected ${param} ${argName}`);
        },
        internal: (error: unknown) => {
            log(`Internal error: ${error instanceof Error ? error.toString() : String(error)}`)
        },
        configNotFound: (path: string) => {
            log(`Unable to find config file at ${path}`);
        },
        configError: (path: string, text: string) => {
            log(`Config error (${path}): ${text}`);
        },
        incompatibleFlags: () => {
            log(`At most one of --check, --func, and --withDecompilation can be set at the same time`);
        },
        noSuchProject: (name: string) => {
            log(`Unable to find project ${name}`);
        },
    };
};

export type CliErrors = ReturnType<typeof CliErrors>
