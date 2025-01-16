import { ConfigProject } from "../config/parseConfig";
import { throwCompilationError } from "../error/errors";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";

export type Stdlib = {
    stdlibTactPath: string;
    stdlibTact: string;
    stdlibFunc: string;
    stdlibExFunc: string;
};

export const getStdLib = (stdlib: VirtualFileSystem): Stdlib => {
    const stdlibTactPath = stdlib.resolve("stdlib.tact");
    if (!stdlib.exists(stdlibTactPath)) {
        throwCompilationError(
            `Could not find stdlib.tact at ${stdlibTactPath}`,
        );
    }
    const stdlibTact = stdlib.readFile(stdlibTactPath).toString();

    const stdlibPath = stdlib.resolve("stdlib.fc");
    const stdlibFunc = stdlib.readFile(stdlibPath).toString();

    const stdlibExPath = stdlib.resolve("stdlib_ex.fc");
    const stdlibExFunc = stdlib.readFile(stdlibExPath).toString();

    return {
        stdlibTactPath,
        stdlibTact,
        stdlibFunc,
        stdlibExFunc,
    };
};

export const getFileWriter = (
    { name: projectName, output: outputPath }: ConfigProject, 
    project: VirtualFileSystem,
) => {
    return (contract: string) => {
        const writeExt = (ext: string) => (code: string | Buffer) => {
            project.writeFile(
                project.resolve(
                    outputPath,
                    `${projectName}_${contract}.${ext}`,
                ),
                code,
            );
        };

        return {
            writeAbi: writeExt("abi"),
            writeBoc: writeExt("code.boc"),
            writeFift: writeExt("code.fif"),
            writeFiftDecompiled: writeExt("code.rev.fif"),
            writePackage: writeExt("pkg"),
            writeBindings: writeExt("ts"),
            writeReport: writeExt("md"),
            writeFunC: (name: string, code: string) => {
                project.writeFile(project.resolve(outputPath, name), code);
            },
        };
    };
};

export type FileWriter = ReturnType<typeof getFileWriter>