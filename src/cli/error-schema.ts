export const CliErrors = (log: (error: string) => void) => {
    return {
        /**
         * @deprecated Because there are incompatible loggers, we have to inform
         * top-level logger that there was an error.
         *
         * Will be removed along with { ok: boolean } returns from `build`
         */
        setHadErrors: () => {
            log("");
        },
        argumentHasParameter: (param: string, argName: string) => {
            log(`Expected ${param} ${argName}`);
        },
        unexpectedArgument: (text: string | undefined) => {
            log(
                `Unexpected ${typeof text === "undefined" ? "end of arguments" : text}`,
            );
        },
        duplicateArgument: (name: string) => {
            log(`Duplicate ${name} argument. Only first argument will be used`);
        },
        internal: (error: unknown) => {
            log(
                `Internal error: ${error instanceof Error ? error.toString() : String(error)}`,
            );
        },
        configNotFound: (path: string) => {
            log(`Unable to find config file at ${path}`);
        },
        configError: (path: string, text: string) => {
            log(`Config error (${path}): ${text}`);
        },
        incompatibleFlags: () => {
            log(
                `At most one of --check, --func, and --withDecompilation can be set at the same time`,
            );
        },
        noSuchProject: (name: string) => {
            log(`Unable to find project ${name}`);
        },
    };
};

export type CliErrors = ReturnType<typeof CliErrors>;
