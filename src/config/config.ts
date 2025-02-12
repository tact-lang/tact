export type SafetyOptions = {
    /**
     * If set to `true`, enables run-time null checks for the `!!` operator. Default is `true`.
     */
    readonly nullChecks?: boolean;
};

export type ExperimentalOptions = {
    /**
     * If set to true, enables inlining of all functions in contracts.
     * This can reduce gas usage at the cost of bigger contracts.
     */
    readonly inline?: boolean;
};

/**
 * Per-project configuration options
 *
 * Read more: https://docs.tact-lang.org/book/config#projects
 */
export type Options = {
    /**
     * If set to true, enables debug output of a contract and allows usage of `dump()` function,
     * which is useful for debugging purposes.
     *
     * Read more: https://docs.tact-lang.org/book/debug
     */
    readonly debug?: boolean;
    /**
     * If set to true, enables support of external message receivers.
     *
     * Read more: https://docs.tact-lang.org/book/external
     */
    readonly external?: boolean;
    /**
     * If set to true, enables generation of a getter with IPFS links describing the contract's ABI.
     *
     * Read more: https://docs.tact-lang.org/ref/evolution/otp-003
     */
    readonly ipfsAbiGetter?: boolean;
    /**
     * If set to true, enables generation of a getter with a list of interfaces provided by the contract.
     *
     * Read more: https://docs.tact-lang.org/book/contracts#interfaces
     */
    readonly interfacesGetter?: boolean;
    /**
     * If set to "new", uses new parser. If set to "old", uses legacy parser. Default is "old".
     */
    readonly parser?: "new" | "old";
    /**
     * Experimental options that might be removed in the future. Use with caution!
     */
    readonly experimental?: ExperimentalOptions;
    /**
     * Safety options for the contract.
     */
    readonly safety?: SafetyOptions;
    /**
     * If set to true, enables generation of `lazy_deployment_completed()` getter.
     */
    readonly enableLazyDeploymentCompletedGetter?: boolean;
};

export type Mode = "fullWithDecompilation" | "full" | "funcOnly" | "checkOnly";

/**
 * Per-project configuration options
 *
 * Read more: https://docs.tact-lang.org/book/config#projects
 */
export type Project = {
    /**
     * Name of the project. All generated files are prefixed with it.
     *
     * Read more: https://docs.tact-lang.org/book/config#projects-name
     */
    name: string;
    /**
     * Path to the project's Tact file. You can only specify one Tact file per project.
     *
     * Read more: https://docs.tact-lang.org/book/config#projects-path
     */
    path: string;
    /**
     * Path to the directory where all generated files will be placed.
     *
     * Read more: https://docs.tact-lang.org/book/config#projects-output
     */
    output: string;
    /**
     * Compilation options for the project.
     *
     * Read more: https://docs.tact-lang.org/book/config#projects-options
     */
    options?: Options;
    /**
     * Compilation mode of the project.
     *
     * Read more: https://docs.tact-lang.org/book/config#projects-mode
     */
    mode?: Mode;

    /**
     * Set verbosity level (higher = more details), default: 1
     */
    verbose?: number;
};

/**
 * Compiler configuration schema
 *
 * Read more: https://docs.tact-lang.org/book/config
 */
export type Config = {
    /**
     * A property for specifying a path or URL to the JSON schema of tact.config.json
     *
     * Read more: https://docs.tact-lang.org/book/config#schema
     */
    $schema?: string;
    /**
     * List of Tact projects with respective compilation options. Each .tact file represents its own Tact project.
     *
     * Read more: https://docs.tact-lang.org/book/config#projects
     */
    projects: readonly Project[];
};
