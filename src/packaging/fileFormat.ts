import { z } from 'zod';

export const fileFormat = z.object({

    // Package, creation date and code
    name: z.string(),
    date: z.string().datetime(),
    code: z.string(),
    abi: z.string(),

    // Init code
    init: z.object({
        code: z.string(),
        args: z.array(z.object({
            name: z.string(),
            type: z.string()
        }))
    }),

    // Deployment schema
    deployment: z.union([z.object({
        kind: z.literal('direct'),
    }), z.object({
        kind: z.literal('system-cell'),
        system: z.string()
    })])
});

export type PackageFileFormat = z.infer<typeof fileFormat>;