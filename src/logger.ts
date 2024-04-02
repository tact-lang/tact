export type TactLogger = {
    log: (message: string) => void;
    error: (message: string) => void;
};

export const consoleLogger: TactLogger = {
    log: console.log,
    error: console.error,
};
