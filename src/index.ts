export { enableFeatures, build } from "./010-pipeline/build";
export { precompile } from "./010-pipeline/precompile";
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
} from "./000-config/parseConfig";
export { AstSorter } from "./grammar/sort";
export { AstRenamer } from "./grammar/rename";
export { AstHasher } from "./grammar/hash";
export { AstComparator } from "./grammar/compare";
