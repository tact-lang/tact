import { z } from "zod";

const configSchema = z.object({
    projects: z.array(z.object({
        name: z.string(),
        path: z.string(),
        output: z.string(),
        contracts: z.array(z.string()).optional(),
        experimental: z.object({
            inline: z.boolean().optional()
        }).optional()
    }))
});

export type Config = z.infer<typeof configSchema>;

export function parseConfig(src: string) {
    let parsed = JSON.parse(src);
    return configSchema.parse(parsed);
}