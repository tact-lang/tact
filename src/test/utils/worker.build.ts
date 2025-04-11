import { run } from "@/cli/tact";
import { createNodeFileSystem } from "@/vfs/createNodeFileSystem";
import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import { parentPort } from "worker_threads";
import * as Stdlib from "@/stdlib/stdlib";
import type { Project } from "@/config/config";
import { Logger, LogLevel } from "@/context/logger";

process.setMaxListeners(0);

if (!parentPort) {
    throw new Error("Not running in a worker thread");
}

export type WorkerInput = {
    readonly id: number;
    readonly folder: string;
    readonly projects: readonly Project[];
};
type MessageType = "log" | "error" | "warn";
type Message = {
    readonly type: MessageType;
    readonly message: string;
};
export type WorkerOutput = {
    readonly ok: boolean;
    readonly messages: readonly Message[];
};

const main = async ({
    id,
    folder,
    projects,
}: WorkerInput): Promise<WorkerOutput> => {
    const stdlib = createVirtualFileSystem("@stdlib", Stdlib.files);
    const project = createNodeFileSystem(folder, false);

    console.log(`Worker #${id}: compiling ${projects.length} projects`);

    const messages: Message[] = [];

    const handleMessage = (type: MessageType, msg: string | Error) => {
        const message = typeof msg === "string" ? msg : String(msg);
        messages.push({ type, message });
    };

    const compileResult = await run({
        config: { projects },
        logger: new Logger(LogLevel.WARN, {
            debug: (message) => {
                handleMessage("log", message);
            },
            error: (message) => {
                handleMessage("error", message);
            },
            info: (message) => {
                handleMessage("log", message);
            },
            warn: (message) => {
                handleMessage("warn", message);
            },
        }),
        project,
        stdlib,
    });

    return {
        ok: compileResult.ok,
        messages,
    };
};

parentPort.once("message", (input: WorkerInput) => {
    main(input)
        .then((result) => {
            parentPort!.postMessage(result);
        })
        .catch((err) => {
            parentPort!.postMessage({ error: String(err) });
        });
});
