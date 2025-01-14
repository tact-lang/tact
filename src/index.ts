export { enableFeatures, build } from "./pipeline/build";
export { precompile } from "./pipeline/precompile";
export {
    TactError,
    TactCompilationError,
    TactInternalCompilerError,
    TactConstEvalError,
    TactErrorCollection,
} from "./error/errors";
export {
    optionsSchema,
    projectSchema,
    configSchema,
} from "./config/parseConfig";
export { AstSorter } from "./grammar/sort";
export { AstRenamer } from "./grammar/rename";
export { AstHasher } from "./grammar/hash";
export { AstComparator } from "./grammar/compare";

export {
    Config,
    ConfigProject,
    parseConfig,
    verifyConfig,
} from "./config/parseConfig";

export { PackageFileFormat } from "./packaging/fileFormat";

export { VirtualFileSystem } from "./vfs/VirtualFileSystem";

export { createVirtualFileSystem } from "./vfs/createVirtualFileSystem";

export * from "./browser";
export * from "./verify";
export * from "./context/logger";
export * from "./error/errors";
