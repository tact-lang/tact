import type * as Ast from "@/next/ast";

export function printType(node: Ast.DecodedType, allowRecover: boolean) {
    function recN(nodes: readonly Ast.DecodedType[]): undefined | string {
        const results: string[] = [];
        for (const node of nodes) {
            const result = rec(node);
            if (result) {
                results.push(result);
            } else {
                return undefined;
            }
        }
        return results.join(', ');
    }

    function rec(node: Ast.DecodedType): undefined | string {
        switch (node.kind) {
            case "recover": {
                return allowRecover ? '$ERROR' : undefined;
            }
            case "type_ref":
            case "TypeAlias": {
                const name = node.name.text;
                if (node.typeArgs.length === 0) {
                    return name;
                } else {
                    const args = recN(node.typeArgs);
                    return args && `${name}<${args}>`;
                }
            }
            case "TypeParam": {
                return node.name.text;
            }
            case "map_type": {
                const key = rec(node.key);
                const value = rec(node.value);
                return key && value && `Map<${key}, ${value}>`;
            }
            case "TypeBounced": {
                return `bounced<${node.name.text}>`;
            }
            case "TypeMaybe": {
                const type = rec(node.type);
                return type && `Maybe<${type}>`;
            }
            case "tuple_type":
            case "tensor_type": {
                const typeArgs = recN(node.typeArgs);
                return typeArgs && `[${typeArgs}]`;
            }
            case "TyInt": {
                return `Int${printIntFormat(node.format)}`
            }
            case "TySlice": {
                return `Slice${printSliceFormat(node.format)}`;
            }
            case "TyCell": {
                return `Cell${printRemFormat(node.format)}`;
            }
            case "TyBuilder": {
                return `Builder${printRemFormat(node.format)}`;
            }
            case "unit_type": {
                return `()`;
            }
            case "TypeVoid": {
                return `Void`;
            }
            case "TypeNull": {
                return `Null`;
            }
            case "TypeBool": {
                return `Bool`;
            }
            case "TypeAddress": {
                return `Address`;
            }
            case "TypeStateInit": {
                return `StateInit`;
            }
            case "TypeString": {
                return `String`;
            }
            case "TypeStringBuilder": {
                return `StringBuilder`;
            }
        }
    }

    return rec(node);
}

const printIntFormat = (format: Ast.IntFormat): string => {
    if (format.kind === 'FInt' && format.sign === 'signed' && format.width === 257) {
        return '';
    }
    return " as " + (format.kind === 'FVarInt' ? "var" : "")
        + (format.sign === 'unsigned' ? 'uint' : 'int')
        + (format.kind === 'FVarInt' ? format.width : format.width.toString());
};

const printSliceFormat = (format: Ast.SliceFormat): string => {
    if (format.kind === 'SFBits') {
        // FIXME: bits not divisible by 8
        return ` as bytes${format.bits >> 3}`;
    } else {
        return printRemFormat(format);
    }
};

const printRemFormat = (format: Ast.RemFormat): string => {
    switch (format.kind) {
        case "SFRemaining": return ` as remaining`;
        case "SFDefault": return ``;
    }
};
