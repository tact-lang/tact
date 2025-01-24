export const CliLogger = () => {
    let hadErrors = false;

    const log = (message: string) => {
        hadErrors = true;
        console.log(message);
    };

    return {
        log,
        hadErrors: () => hadErrors,
    };
};
