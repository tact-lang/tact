export { enableFeatures, build } from "./010-pipeline/build";
export { precompile } from "./010-pipeline/precompile";
export {
    TactError,
    TactCompilationError,
    TactInternalCompilerError,
    TactConstEvalError,
    TactErrorCollection,
} from "./030-error/errors";
export {
    optionsSchema,
    projectSchema,
    configSchema,
} from "./000-config/parseConfig";
export { AstSorter } from "./050-grammar/sort";
export { AstRenamer } from "./050-grammar/rename";
export { AstHasher } from "./050-grammar/hash";
export { AstComparator } from "./050-grammar/compare";

export {
    Config,
    ConfigProject,
    parseConfig,
    verifyConfig,
} from "./000-config/parseConfig";

export { PackageFileFormat } from "./110-packaging/fileFormat";

export { VirtualFileSystem } from "./020-vfs/VirtualFileSystem";

export { createVirtualFileSystem } from "./020-vfs/createVirtualFileSystem";

export * from "./browser";
export * from "./010-pipeline/logger";
export * from "./030-error/errors";
