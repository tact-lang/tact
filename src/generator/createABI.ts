import { ContractABI, ContractStruct } from "../abi/ContractABI";
import { CompilerContext } from "../ast/context";
import { getAllTypes } from "../types/resolveTypeDescriptors";

export function createABI(ctx: CompilerContext, code: string): ContractABI {

    let allTypes = Object.values(getAllTypes(ctx));

    // Contract
    let contract = allTypes.find((v) => v.kind === 'contract')!;
    if (contract.kind !== 'contract') {
        throw Error('Not a contract');
    }

    // Structs
    let structs: ContractStruct[] = [];
    for (let t of allTypes) {
        if (t.kind === 'struct') {
            structs.push({ name: t.name, header: 0, fields: t.fields.map((v) => ({ name: v.name, type: v.type })) });
        }
    }

    return {
        name: contract.name,
        structs,
        code
    }
}