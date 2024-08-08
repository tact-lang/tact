export enum LogLevel {
    /** Logging is turned off */
    NONE,
    /** Logs only error messages */
    ERROR,
    /** Logs warning and error messages */
    WARN,
    /** Logs informational, warning, and error messages */
    INFO,
    /** Logs debugging, informational, warning, and error messages */
    DEBUG,
}

type messageType = string | Error;

/**
 * Interface defining the logging methods used by the `Logger` class, enabling
 * custom logger implementations.
 */
export interface ILogger {
    debug: (message: messageType) => void;
    info: (message: messageType) => void;
    warn: (message: messageType) => void;
    error: (message: messageType) => void;
}

const logLevelToMethodName: { [key in LogLevel]: keyof ILogger | null } = {
    [LogLevel.NONE]: null,
    [LogLevel.ERROR]: "error",
    [LogLevel.WARN]: "warn",
    [LogLevel.INFO]: "info",
    [LogLevel.DEBUG]: "debug",
};

function getLoggingMethod(level: LogLevel): keyof ILogger | null {
    return logLevelToMethodName[level];
}

export class Logger {
    private level: LogLevel;
    private logMethods: ILogger;

    constructor(level: LogLevel = LogLevel.INFO) {
        this.level = level;
        this.logMethods = {
            debug: console.log,
            info: console.log,
            warn: console.warn,
            error: console.error,
        };
    }

    protected log(level: LogLevel, message: messageType) {
        if (this.level === LogLevel.NONE) {
            return;
        }

        if (message instanceof Error) {
            message = message.stack ?? message.message;
        } else {
            message = message.toString();
        }

        if (level > this.level) return;

        const loggingMethod = getLoggingMethod(level);
        if (!loggingMethod) return;

        this.logMethods[loggingMethod](message);
    }

    debug(message: messageType) {
        this.log(LogLevel.DEBUG, message);
    }

    info(message: messageType) {
        this.log(LogLevel.INFO, message);
    }

    warn(message: messageType) {
        this.log(LogLevel.WARN, message);
    }

    error(message: messageType) {
        this.log(LogLevel.ERROR, message);
    }

    setLevel(level: LogLevel) {
        this.level = level;
    }
}
