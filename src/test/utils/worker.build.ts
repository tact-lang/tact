import { run } from '@/cli/tact';
import { createNodeFileSystem } from '@/vfs/createNodeFileSystem';
import { createVirtualFileSystem } from '@/vfs/createVirtualFileSystem';
import { parentPort } from 'worker_threads';
import files from "@/stdlib/stdlib";
import type { Project } from '@/config/config';
import { Logger, LogLevel } from '@/context/logger';

process.setMaxListeners(0);

if (!parentPort) {
    throw new Error('Not running in a worker thread');
}

export type WorkerInput = {
    readonly id: number;
    readonly folder: string,
    readonly projects: readonly Project[]
};
export type WorkerOutput = {
    readonly ok: boolean;
};

const main = async ({ id, folder, projects }: WorkerInput): Promise<WorkerOutput> => {
    const stdlib = createVirtualFileSystem("@stdlib", files);
    const project = createNodeFileSystem(folder, false);

    console.log(`Worker #${id}: compiling ${projects.length} projects`);

    const compileResult = await run({
        config: { projects },
        logger: new Logger(LogLevel.WARN),
        project,
        stdlib,
    });

    return {
        ok: compileResult.ok,
    };
}

parentPort.once('message', (input: WorkerInput) => {
  main(input)
    .then((result) => {
      parentPort!.postMessage(result);
    })
    .catch((err) => {
      parentPort!.postMessage({ error: String(err) });
    });
});
