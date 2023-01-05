import { z } from 'zod';

export const fileFormat = z.object({

    // Package, creation date and code
    name: z.string(),
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
    })]),

    // Compiler information
    compiler: z.object({
        name: z.string(),
        version: z.string(),
        parameters: z.string().optional()
    })
});

export type PackageFileFormat = z.infer<typeof fileFormat>;