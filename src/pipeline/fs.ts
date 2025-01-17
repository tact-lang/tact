/* eslint-disable @typescript-eslint/require-await */
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

export const getFileWriter = (args: {
    projectName: string;
    outputDir: string;
    projectFs: VirtualFileSystem;
}) => {
    return (contract: string) => {
        const writeExt = (ext: string) => async (code: string | Buffer) => {
            args.projectFs.writeFile(
                args.projectFs.resolve(
                    args.outputDir,
                    `${args.projectName}_${contract}.${ext}`,
                ),
                code,
            );
        };

        return {
            abi: writeExt("abi"),
            boc: writeExt("code.boc"),
            fift: writeExt("code.fif"),
            fiftDecompiled: writeExt("code.rev.fif"),
            package: writeExt("pkg"),
            bindings: writeExt("ts"),
            report: writeExt("md"),
            funC: async (codeFc: Record<string, string>) => {
                for (const [name, code] of Object.entries(codeFc)) {
                    args.projectFs.writeFile(
                        args.projectFs.resolve(args.outputDir, name),
                        code,
                    );
                }
            },
        };
    };
};

export type FileWriter = ReturnType<typeof getFileWriter>;
export type ContractWriter = ReturnType<FileWriter>;
