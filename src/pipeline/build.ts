/* eslint-disable @typescript-eslint/require-await */
import { beginCell, Cell, ContractABI, Dictionary } from "@ton/core";
import { decompileAll } from "@tact-lang/opcode";
import { writeTypescript } from "../bindings/writeTypescript";
import { featureEnable } from "../config/features";
import { ConfigProject } from "../config/parseConfig";
import { CompilerContext } from "../context/context";
import { funcCompileWrap } from "../func/funcCompile";
import { writeReport } from "../generator/writeReport";
import { ILogger, Logger } from "../context/logger";
import { createABITypeRefFromTypeRef } from "../types/resolveABITypeRef";
import { getContracts, getType } from "../types/resolveDescriptors";
import { posixNormalize } from "../utils/filePath";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { resolveDescriptors } from "../types/resolveDescriptors";
import { resolveAllocations } from "../storage/resolveAllocation";
import { openContext } from "../context/store";
import { resolveStatements } from "../types/resolveStatements";
import { resolveErrors } from "../types/resolveErrors";
import { resolveSignatures } from "../types/resolveSignatures";
import { Imports, resolveImports, Source } from "../imports/resolveImports";
import { AstImport, AstModule, FactoryAst, getAstFactory, idText } from "../ast/ast";
import { getParser, ItemOrigin, Parser } from "../grammar";
import { defaultParser } from "../grammar/grammar";
import { getFileWriter, getStdLib, Stdlib } from "./fs";
import { createABI } from "../generator/createABI";
import { writeProgram } from "../generator/writeProgram";
import { calculateIPFSlink } from "../utils/calculateIPFSlink";
import { InitDescription, TypeDescription } from "../types/types";
import { fileFormat, PackageFileFormat } from "../packaging/fileFormat";
import { getCompilerVersion } from "./version";
import { createVirtualFileSystem } from "../vfs/createVirtualFileSystem";
import files from "../stdlib/stdlib";

export function enableFeatures(
    ctx: CompilerContext,
    logger: ILogger,
    config: ConfigProject,
): CompilerContext {
    if (config.options === undefined) {
        return ctx;
    }
    const features = [
        { option: config.options.debug, name: "debug" },
        { option: config.options.external, name: "external" },
        { option: config.options.experimental?.inline, name: "inline" },
        { option: config.options.ipfsAbiGetter, name: "ipfsAbiGetter" },
        { option: config.options.interfacesGetter, name: "interfacesGetter" },
    ];
    return features.reduce((currentCtx, { option, name }) => {
        if (option) {
            logger.debug(`   > 👀 Enabling ${name}`);
            return featureEnable(currentCtx, name);
        }
        return currentCtx;
    }, ctx);
}

const stage = <T extends unknown[], U>(
    name: string,
    callback: (...args: T) => Promise<U>
) => (...args: T): Promise<U> => {
    return callback(...args);
};

// const attempt = async <T>(
//     name: string,
//     f: () => Promise<T>,
// ): Promise<{ ok: true; value: T } | { ok: false; error: Error[] }> => {
//     logger.info(`${name} started`);
//     try {
//         return {
//             ok: true,
//             value: await f(),
//         };
//     } catch (e) {
//         if (!(e instanceof Error)) {
//             throw e;
//         }
//         logger.error(`${name} failed`);
//         logger.error(e);
//         return {
//             ok: false,
//             error: [e],
//         };
//     }
// };

// export const makeBuild = () => {
//     const compilerVersion = getCompilerVersion();
//     const logger = new Logger();
//     const ast = getAstFactory();
//     const parser = getParser(ast, config.options?.parser ?? defaultParser);
//     const stdlibFs = createVirtualFileSystem("@stdlib", files);
//     const stdlib = getStdLib(stdlibFs);
//     const writer = getFileWriter(config, projectFs);
// };

const checkImports = stage("Checking imports", async (args: {
    parseImports: (src: string, path: string, origin: ItemOrigin) => AstImport[]
    stdlib: Stdlib;
    projectFs: VirtualFileSystem;
    stdlibFs: VirtualFileSystem;
    entrypoint: string
}) => {
    // Load all sources
    return resolveImports(args);
})

const parseImports = stage("Parse", async (args: {
    parse: (src: string, path: string, origin: ItemOrigin) => AstModule;
    imports: Imports;
}) => {
    // Parse sources
    return Object.entries(args.imports.tact).map(([path, { code, origin }]) =>
        args.parse(code, path, origin),
    );
})

const checkTypes = stage("Checking types", async (args: {
    sources: AstModule[];
    ast: FactoryAst;
    ctx: CompilerContext;
}) => {
    let ctx = args.ctx;
    // Add information about all the source code entries to the context
    ctx = openContext(ctx, args.sources);
    // First load type descriptors and check that they all have valid signatures
    ctx = resolveDescriptors(ctx, args.ast);
    // This creates TLB-style type definitions
    ctx = resolveSignatures(ctx, args.ast);
    // This checks and resolves all statements
    ctx = resolveStatements(ctx, args.ast);
    // This extracts error messages
    ctx = resolveErrors(ctx, args.ast);
    // This creates allocations for all defined types
    const _ctx = resolveAllocations(ctx); // FIXME
});

const compileTact = stage(`Tact compilation`, async (args: {
    packageName: string;
    contractName: string;
    funcSources: Record<string, Source>
    ctx: CompilerContext;
}) => {
    const abiSrc = createABI(args.ctx, args.contractName);
    const abi = JSON.stringify(abiSrc);
    const result = writeProgram({
        ctx: args.ctx,
        abiSrc,
        abiLink: await calculateIPFSlink(Buffer.from(abi)),
        basename: args.packageName + "_" + args.contractName,
        funcSources: args.funcSources,
    });
    return { ...result, abi };
})

const compileFunc = stage(`FunC compilation`, async (args: {
    entrypoint: string;
    stdlib: Stdlib;
    codeFc: { name: string, code: string }[],
}) => {
    // Names don't really matter, as FunC will
    // make definitions available anyway
    const funcVfsStdlibPath = "/stdlib.fc";
    const funcVfsStdlibExPath = "/stdlib_ex.fc";
    const c = await funcCompileWrap({
        entries: [
            funcVfsStdlibPath,
            funcVfsStdlibExPath,
            args.entrypoint,
        ],
        sources: [
            {
                path: funcVfsStdlibPath,
                content: args.stdlib.stdlibFunc,
            },
            {
                path: funcVfsStdlibExPath,
                content: args.stdlib.stdlibExFunc,
            },
            ...args.codeFc.map(({ name, code }) => ({
                path: `/${name}`,
                content: code,
            })),
        ],
    });
    return { fift: c.fift, codeBoc: c.output };
})

const getSystemCell = (
    childContracts: { uid: number, code: Buffer }[]
) => {
    if (childContracts.length === 0) {
        return null;
    }
    const depends = Dictionary.empty(
        Dictionary.Keys.Uint(16),
        Dictionary.Values.Cell(),
    );
    for (const { uid, code } of childContracts) {
        depends.set(uid, Cell.fromBoc(code)[0]!);
    }
    return beginCell().storeDict(depends).endCell().toBoc().toString("base64");
};

const compileContractData = (args: {
    ctx: CompilerContext;
    childContracts: { uid: number, code: Buffer }[];
    codeBoc: Buffer;
    init: InitDescription;
}) => ({
    prefix: {
        bits: 1,
        value: 0,
    },
    system: getSystemCell(args.childContracts),
    code: args.codeBoc.toString("base64"),
    args: args.init!.params.map((v) => ({
        name: idText(v.name),
        type: createABITypeRefFromTypeRef(args.ctx, v.type, v.loc),
    })),
});

type CompiledContract = ReturnType<typeof compileContractData>

const compilePackage = stage(`Package`, async ({
    compilerVersion,
    contractName,
    contract,
    abi,
    allSources,
    projectFs,
    config,
}: {
    compilerVersion: string;
    contractName: string;
    contract: CompiledContract;
    abi: string;
    allSources: Record<string, Source>;
    projectFs: VirtualFileSystem;
    config: ConfigProject;
}) => {
    const pkg: PackageFileFormat = {
        // FIXME
        name: contractName,
        abi,
        code: contract.code,
        init: {
            kind: "direct",
            args: contract.args,
            prefix: contract.prefix,
            deployment: {
                kind: "system-cell",
                system: contract.system,
            },
        },
        sources: Object.fromEntries(
            Object.entries(allSources)
                .filter(([, { origin }]) => origin === 'user')
                .map(([path, { code }]) => [
                    posixNormalize(path.slice(projectFs.root.length)),
                    Buffer.from(code).toString("base64"),
                ])
        ),
        compiler: {
            name: "tact",
            version: compilerVersion,
            parameters: JSON.stringify({
                entrypoint: posixNormalize(config.path),
                options: config.options ?? {},
            }),
        },
    };

    return JSON.stringify(fileFormat.parse(pkg));
});

const compileBindings = stage(`Bindings`, async (abiSrc: ContractABI, contract: CompiledContract) => {
    return writeTypescript(abiSrc, contract);
});

type GetChildren = (args: {
    contractName: string,
    codeBoc: Buffer,
    dependsOn: TypeDescription[],
}) => Promise<{
    uid: number;
    code: Buffer;
}[]>;

// : dependsOn.map(({uid, name}) => ({ uid, code: resolveDep(name) }))
// resolveDep: (contract: string) => Buffer
// const resolveDep = (contract: string) => {
//     const cd = built[contract];
//     if (typeof cd === "undefined") {
//         throw new Error(`Dependency ${contract} was not found`);
//     }
//     return cd.codeBoc;
// };
// for (const { pack } of Object.values(built)) {
//     await pack(resolveDep);
// }
// const built: Record<
//     string,
//     {
//         codeBoc: Buffer;
//         pack: (resolveDep: (contract: string) => Buffer) => Promise<void>;
//     }
// > = {};

const compileContract = (contractName: string) => async (getChildren: GetChildren) => {
    const cw = writer(contractName);

    const { codeFc, entrypoint, abi, abiSrc } = await compileTact({
        ctx,
        funcSources,
        packageName: config.name,

        contractName,
    });

    for (const files of codeFc) {
        cw.writeFunC(files.name, files.code);
    }

    cw.writeAbi(abi);

    if (config.mode === "funcOnly") {
        return;
    }

    const { codeBoc, fift } = await compileFunc({
        stdlib,

        codeFc,
        entrypoint,
    });

    cw.writeFift(fift);
    cw.writeBoc(codeBoc);

    if (config.mode === "fullWithDecompilation") {
        // Fift decompiler for generated code debug
        await stage(`Decompilation`, async () => {
            cw.writeFiftDecompiled(decompileAll({ src: codeBoc }));
        });
    }

    const { dependsOn, init } = getType(
        ctx,

        contractName,
    );

    const childContracts = await getChildren({ contractName, codeBoc, dependsOn });

    const contract = compileContractData({
        ctx,

        childContracts,
        codeBoc,
        init: init!,
    })

    const pkg = await compilePackage({
        allSources,
        compilerVersion,
        config,
        projectFs,

        abi,
        contract,
        contractName,
    });

    cw.writePackage(pkg);

    const bindings = await compileBindings(abiSrc, contract);
    
    cw.writeBindings(bindings);

    await stage(`Reports`, async () => {
        cw.writeReport(
            writeReport(ctx, { abi: abiSrc, code: contract.code, name: contractName }),
        );
    });
};

export async function build({
    config,
    projectFs,
    stdlibFs,
    compilerVersion,
    logger = new Logger(),
    ast = getAstFactory(),
    parser = getParser(ast, config.options?.parser ?? defaultParser),
}: {
    config: ConfigProject;
    projectFs: VirtualFileSystem;
    stdlibFs: VirtualFileSystem;
    compilerVersion: string,
    logger?: ILogger;
    parser?: Parser;
    ast?: FactoryAst;
}): Promise<void> {
    const stdlib = getStdLib(stdlibFs);
    const writer = getFileWriter(config, projectFs);

    // Configure context
    let ctx: CompilerContext = new CompilerContext();
    ctx = enableFeatures(ctx, logger, config);

    // FIXME
    const entrypoint = config.path;

    const imports = await checkImports({
        parseImports: parser.parseImports, 
        stdlib, projectFs, stdlibFs,
        entrypoint,
    });

    const { func: funcSources, tact: tactSources } = imports;
    const allSources = { ...funcSources, ...tactSources };

    const sources = await parseImports({
        imports,
        parse: parser.parse,
    });

    await checkTypes({ sources, ast, ctx });

    // TODO: extract dependsOn, toposort

    if (config.mode === "checkOnly") {
        return;
    }

    for (const contractName of getContracts(ctx)) {
        compileContract(contractName)
    }
}
