import { z } from "zod";

const optionsSchema = z
    .object({
        debug: z.boolean().optional(),
        masterchain: z.boolean().optional(),
        external: z.boolean().optional(),
        experimental: z
            .object({
                inline: z.boolean().optional(),
            })
            .strict()
            .optional(),
    })
    .strict();

const projectSchema = z
    .object({
        name: z.string(),
        path: z.string(),
        output: z.string(),
        options: optionsSchema.optional(),
        mode: z
            .enum(["fullWithDecompilation", "full", "funcOnly", "checkOnly"])
            .optional(),
    })
    .strict();

const configSchema = z
    .object({
        $schema: z.string().optional(),
        projects: z.array(projectSchema),
    })
    .strict();

export type Config = z.infer<typeof configSchema>;
export type ConfigProject = z.infer<typeof projectSchema>;
export type Options = z.infer<typeof optionsSchema>;

export function parseConfig(src: string) {
    const parsed = JSON.parse(src);
    return configSchema.parse(parsed);
}

export function verifyConfig(config: Config) {
    return configSchema.parse(config);
}
