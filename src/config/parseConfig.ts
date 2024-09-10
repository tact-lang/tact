import { z } from "zod";

const optionsSchema = z
    .object({
        /**
         * If set to true, enables debug output of a contract and allows usage of `dump()` function,
         * which is useful for debugging purposes.
         *
         * Read more: https://docs.tact-lang.org/book/debug
         */
        debug: z.boolean().optional(),
        /**
         * If set to true, enables masterchain support.
         *
         * Read more: https://docs.tact-lang.org/book/masterchain
         */
        masterchain: z.boolean().optional(),
        /**
         * If set to true, enables support of external message receivers.
         *
         * Read more: https://docs.tact-lang.org/book/external
         */
        external: z.boolean().optional(),
        /**
         * If set to true, enables generation of a getter with IPFS links describing the contract's ABI.
         *
         * Read more: https://docs.tact-lang.org/ref/evolution/OTP-003
         */
        ipfsAbiGetter: z.boolean().optional(),
        /**
         * If set to true, enables generation of a getter with a list of interfaces provided by the contract.
         *
         * Read more: https://docs.tact-lang.org/book/contracts#interfaces
         */
        interfacesGetter: z.boolean().optional(),
        /**
         * Experimental options that might be removed in the future. Use with caution!
         */
        experimental: z
            .object({
                /**
                 * If set to true, enables inlining of all functions in contracts.
                 * This can reduce gas usage at the cost of bigger contracts.
                 */
                inline: z.boolean().optional(),
            })
            .strict()
            .optional(),
    })
    .strict();

const projectSchema = z
    .object({
        /**
         * Name of the project. All generated files are prefixed with it.
         *
         * Read more: https://docs.tact-lang.org/book/config#projects-name
         */
        name: z.string(),
        /**
         * Path to the project's Tact file. You can only specify one Tact file per project.
         *
         * Read more: https://docs.tact-lang.org/book/config#projects-path
         */
        path: z.string(),
        /**
         * Path to the directory where all generated files will be placed.
         *
         * Read more: https://docs.tact-lang.org/book/config#projects-output
         */
        output: z.string(),
        /**
         * Compilation options for the project.
         *
         * Read more: https://docs.tact-lang.org/book/config#projects-options
         */
        options: optionsSchema.optional(),
        /**
         * Compilation mode of the project.
         *
         * Read more: https://docs.tact-lang.org/book/config#projects-mode
         */
        mode: z
            .enum(["fullWithDecompilation", "full", "funcOnly", "checkOnly"])
            .optional(),
    })
    .strict();

const configSchema = z
    .object({
        /**
         * A property for specifying a path or URL to the JSON schema of tact.config.json
         *
         * Read more: https://docs.tact-lang.org/book/config#schema
         */
        $schema: z.string().optional(),
        /**
         * List of Tact projects with respective compilation options. Each .tact file represents its own Tact project.
         *
         * Read more: https://docs.tact-lang.org/book/config#projects
         */
        projects: z.array(projectSchema),
    })
    .strict();

/**
 * Compiler configuration schema
 *
 * Read more: https://docs.tact-lang.org/book/config
 */
export type Config = z.infer<typeof configSchema>;

/**
 * Per-project configuration options
 *
 * Read more: https://docs.tact-lang.org/book/config#projects
 */
export type ConfigProject = z.infer<typeof projectSchema>;

/**
 * Per-project configuration options
 *
 * Read more: https://docs.tact-lang.org/book/config#projects
 */
export type Options = z.infer<typeof optionsSchema>;

/**
 * Takes a stringified JSON [src] of a schema, converts to JSON and returns a parsed schema if it's valid
 *
 * @throws If the provided JSON string isn't a valid JSON
 * @throws If the provided JSON string isn't valid according to the config schema
 */
export function parseConfig(src: string) {
    const parsed = JSON.parse(src);
    return configSchema.parse(parsed);
}

/**
 * Takes a config schema object and verifies that it's valid
 *
 * @throws If the provided object isn't valid according to the config schema
 */
export function verifyConfig(config: Config) {
    return configSchema.parse(config);
}
