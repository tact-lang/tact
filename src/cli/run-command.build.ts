import { exec } from "child_process";

type Result = Exited | Signaled;
type Exited = { kind: "exited"; code: number; stdout: string };
type Signaled = { kind: "signaled"; signal: NodeJS.Signals };

export const runCommand = (command: string, cwd: string) => {
    const thread = exec(command, { cwd });
    return new Promise<Result>((resolve, reject) => {
        const chunks: string[] = [];
        thread.stdout?.on("data", (chunk) => {
            chunks.push(chunk);
        });
        thread.on("error", (code) => {
            reject(code);
        });
        thread.on("exit", (code, signal) => {
            if (code !== null) {
                resolve({ kind: "exited", code, stdout: chunks.join("") });
            } else if (signal !== null) {
                resolve({ kind: "signaled", signal });
            } else {
                reject(new Error("Node.js bug"));
            }
        });
    });
};
