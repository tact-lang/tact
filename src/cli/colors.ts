import { release } from "os";

export const isColorSupported = () => {
    if (process.env.CI) {
        return true;
    }
    if (process.env.JEST) {
        return false;
    }
    if (process.platform === "win32") {
        const [major, _, build] = release().split(".").map(Number);
        // Windows 10, Build 10586+
        return (
            (major && major > 10) || (major === 10 && build && build >= 10586)
        );
    }
    if (process.stdout.isTTY && process.env.TERM !== "dumb") {
        return true;
    }
    return false;
};

const format = (code: number) => (input: string) =>
    `\x1b[${code}m${input}\x1b[39m`;

const id = () => (s: string) => s;

export const getColors = (isEnabled: boolean, f = isEnabled ? format : id) => ({
    reset: (input: string) => `\x1b[0m${input}`,
    red: f(31),
    green: f(32),
    yellow: f(33),
    blue: f(34),
    magenta: f(35),
    cyan: f(36),
    white: f(37),
    gray: f(90),
});

export type Colors = ReturnType<typeof getColors>;
