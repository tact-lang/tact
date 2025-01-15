type FixedWidthFormat = "int" | "uint";
type VarWidthFormat = "varint" | "varuint";

export type MapIntKeyDescription =
    | {
          format: FixedWidthFormat;
          size: number;
      }
    | { format: null };

export type MapIntValDescription =
    | MapIntKeyDescription
    | {
          format: VarWidthFormat;
          size: 16 | 32;
      }
    | { format: "coins" };

const minSignedInt = (nBits: number): bigint => -(2n ** (BigInt(nBits) - 1n));

const maxSignedInt = (nBits: number): bigint => 2n ** (BigInt(nBits) - 1n) - 1n;

const minUnsignedInt = (_nBits: number): bigint => 0n;

const maxUnsignedInt = (nBits: number): bigint => 2n ** BigInt(nBits) - 1n;

const minVarInt = (size: number): bigint => minSignedInt(8 * (size - 1));

const maxVarInt = (size: number): bigint => maxSignedInt(8 * (size - 1));

const minVarUInt = (_size: number): bigint => 0n;

const maxVarUInt = (size: number): bigint => maxUnsignedInt(8 * (size - 1));

export const minInt = (descr: MapIntValDescription): bigint => {
    switch (descr.format) {
        case null:
            return minSignedInt(257);
        case "int":
            return minSignedInt(descr.size);
        case "uint":
            return minUnsignedInt(descr.size);
        case "varint":
            return minVarInt(descr.size);
        case "varuint":
            return minVarUInt(descr.size);
        case "coins":
            return minVarUInt(16);
    }
};

export const maxInt = (descr: MapIntValDescription) => {
    switch (descr.format) {
        case null:
            return maxSignedInt(257);
        case "int":
            return maxSignedInt(descr.size);
        case "uint":
            return maxUnsignedInt(descr.size);
        case "varint":
            return maxVarInt(descr.size);
        case "varuint":
            return maxVarUInt(descr.size);
        case "coins":
            return maxVarUInt(16);
    }
};

export const descriptionToString = (descr: MapIntValDescription): string => {
    switch (descr.format) {
        case null:
            return "Int";
        case "int":
        case "uint":
        case "varint":
        case "varuint":
            return `Int as ${descr.format}${descr.size}`;
        case "coins":
            return "Int as coins";
    }
};

const signedIntFormats: MapIntKeyDescription[] = [
    { format: "int", size: 2 },
    { format: "int", size: 10 },
    { format: "int", size: 37 },
    { format: "int", size: 256 },
    { format: "int", size: 257 },
    { format: null },
];

const unsignedIntFormats: MapIntKeyDescription[] = [
    { format: "uint", size: 2 },
    { format: "uint", size: 8 },
    { format: "uint", size: 32 },
    { format: "uint", size: 256 },
];

const varIntFormats: MapIntValDescription[] = [
    { format: "varint", size: 16 },
    { format: "varint", size: 32 },
    { format: "varuint", size: 16 },
    { format: "varuint", size: 32 },
    { format: "coins" },
];

const fixedWidthInts: MapIntKeyDescription[] =
    signedIntFormats.concat(unsignedIntFormats);

export const intKeyFormats: MapIntKeyDescription[] = fixedWidthInts;

export const intValFormats: MapIntValDescription[] =
    varIntFormats.concat(fixedWidthInts);
