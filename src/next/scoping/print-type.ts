import type * as Ty from "@/next/scoping/generated/type";

export const printType = (type: Ty.Type): string => {
    switch (type.kind) {
        case "ERROR": return `_`;
        case "type_var": return `#${type.id}`;
        case "unit_type": return `()`;
        case "TyInt": return `Int${printIntFormat(type.format)}`
        case "TySlice": return `Slice${printSliceFormat(type.format)}`;
        case "TyCell": return `Cell${printRemFormat(type.format)}`;
        case "TyBuilder": return `Builder${printRemFormat(type.format)}`;
        case "tuple_type": return `[${printTypeList(type.typeArgs)}]`;
        case "tensor_type": return `(${printTypeList(type.typeArgs)})`;
        case "map_type": return `map<${printType(type.key)}, ${printType(type.value)}>`
        case "cons_type": {
            return type.name.text + (
                type.typeArgs.length === 0
                    ? ''
                    : `<${printTypeList(type.typeArgs)}>`
            );
        }
    }
};

const printTypeList = (types: readonly Ty.Type[]): string => {
    return types.map(type => printType(type)).join(', ');
};

const printIntFormat = (format: Ty.IntFormat): string => {
    if (format.kind === 'FInt' && format.sign === 'signed' && format.width === 257) {
        return '';
    }
    return " as " + (format.kind === 'FVarInt' ? "var" : "")
        + (format.sign === 'unsigned' ? 'uint' : 'int')
        + (format.kind === 'FVarInt' ? format.width : format.width.toString());
};

const printSliceFormat = (format: Ty.SliceFormat): string => {
    if (format.kind === 'SFBits') {
        // FIXME: bits not divisible by 8
        return ` as bytes${format.bits >> 3}`;
    } else {
        return printRemFormat(format);
    }
};

const printRemFormat = (format: Ty.RemFormat): string => {
    switch (format.kind) {
        case "SFRemaining": return ` as remaining`;
        case "SFDefault": return ``;
    }
};
