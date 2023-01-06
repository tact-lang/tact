import { z } from 'zod';

export const typeFormat = z.union([
    z.object({
        kind: z.literal('simple'),
        type: z.string(),
        optional: z.boolean().optional().nullable(),
        format: z.union([z.boolean(), z.number(), z.string()]).optional().nullable()
    }),
    z.object({
        kind: z.literal('map'),
        format: z.union([z.boolean(), z.number(), z.string()]).optional().nullable(),
        key: z.string(),
        keyFormat: z.union([z.boolean(), z.number(), z.string()]).optional().nullable(),
        value: z.string(),
        valueFormat: z.union([z.boolean(), z.number(), z.string()]).optional().nullable(),
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
        parameters: z.string().optional().nullable()
    })
});

export type PackageFileFormat = z.infer<typeof fileFormat>;