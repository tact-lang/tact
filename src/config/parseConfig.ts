import { z } from "zod";

const projectSchema = z.object({
    name: z.string(),
    path: z.string(),
    output: z.string(),
    contracts: z.array(z.string()).optional(),
    experimental: z.object({
        inline: z.boolean().optional()
    }).optional()
});

const configSchema = z.object({
    projects: z.array(projectSchema)
});

export type Config = z.infer<typeof configSchema>;
export type ConfigProject = z.infer<typeof projectSchema>;

export function parseConfig(src: string) {
    let parsed = JSON.parse(src);
    return configSchema.parse(parsed);
}