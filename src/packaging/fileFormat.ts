import { z } from "zod";

const format = z
    .union([z.boolean(), z.number(), z.string(), z.undefined()])
    .optional()
    .nullable()
    .transform((val) => (val === null ? undefined : val));

const optional = z
    .boolean()
    .default(false)
    .nullable()
    .transform((val) => val ?? false);

const typeFormat = z.union([
    z
        .object({
            kind: z.literal("simple"),
            type: z.string(),
            optional: optional,
            format: format,
        })
        .transform((o) => ({ ...o, format: o.format })),
    z
        .object({
            kind: z.literal("dict"),
            format: format,
            key: z.string(),
            keyFormat: format,
            value: z.string(),
            valueFormat: format,
        })
        .transform((o) => ({
            ...o,
            format: o.format,
            keyFormat: o.keyFormat,
            valueFormat: o.valueFormat,
        })),
]);

const initFormat = z.object({
    kind: z.literal("direct"),
    args: z.array(
        z.object({
            name: z.string(),
            type: typeFormat,
        }),
    ),
    prefix: z
        .object({
            bits: z.number(),
            value: z.number(),
        })
        .optional(),
    deployment: z.union([
        z.object({
            kind: z.literal("direct"),
        }),
        z.object({
            kind: z.literal("system-cell"),
            system: z.string().nullable(),
        }),
    ]),
});

export const fileFormat = z.object({
    // Contract name, code and abi
    name: z.string(),
    code: z.string(),
    abi: z.string(),

    // Deployment
    init: initFormat,

    // Sources
    sources: z.record(z.string(), z.string()).optional(),

    // Compiler information
    compiler: z.object({
        name: z.string(),
        version: z.string(),
        parameters: z.string().optional().nullable(),
    }),
});

export type PackageFileFormat = z.infer<typeof fileFormat>;
