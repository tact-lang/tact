import { z } from 'zod';

export const typeFormat = z.union([
    z.object({
        kind: z.literal('simple'),
        name: z.string(),
        optional: z.boolean().optional(),
        format: z.union([z.boolean(), z.number(), z.string()]).optional()
    }),
    z.object({
        kind: z.literal('map'),
        format: z.union([z.boolean(), z.number(), z.string()]).optional(),
        key: z.string(),
        keyFormat: z.union([z.boolean(), z.number(), z.string()]).optional(),
        value: z.string(),
        valueFormat: z.union([z.boolean(), z.number(), z.string()]).optional(),
    }),
]);

export const initFormat = z.object({
    code: z.string(),
    args: z.array(z.object({
        name: z.string(),
        type: typeFormat
    })),
    deployment: z.union([z.object({
        kind: z.literal('direct'),
    }), z.object({
        kind: z.literal('system-cell'),
        system: z.string()
    })]),
});

export const fileFormat = z.object({

    // Contract name, code and abi
    name: z.string(),
    code: z.string(),
    abi: z.string(),

    // Deployment
    init: initFormat,

    // Compiler information
    compiler: z.object({
        name: z.string(),
        version: z.string(),
        parameters: z.string().optional()
    })
});

export type PackageFileFormat = z.infer<typeof fileFormat>;