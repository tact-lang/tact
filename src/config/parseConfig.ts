import { z } from "zod";

const projectSchema = z.object({
    name: z.string(),
    path: z.string(),
    output: z.string(),
    contracts: z.array(z.string()).optional(),
    parameters: z.object({
        debug: z.boolean().optional()
    }).strict().optional(),
    experimental: z.object({
        inline: z.boolean().optional()
    }).strict().optional()
}).strict();

const configSchema = z.object({
    projects: z.array(projectSchema)
}).strict();

export type Config = z.infer<typeof configSchema>;
export type ConfigProject = z.infer<typeof projectSchema>;

export function parseConfig(src: string) {
    let parsed = JSON.parse(src);
    return configSchema.parse(parsed);
}