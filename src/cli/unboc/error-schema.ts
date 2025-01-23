export const UnbocErrors = (log: (error: string) => void) => {
    return {
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
        unexpected: (error: unknown) => {
            log(
                `Unexpected error: ${error instanceof Error ? error.toString() : String(error)}`,
            );
        },
    };
};

export type UnbocErrors = ReturnType<typeof UnbocErrors>;
