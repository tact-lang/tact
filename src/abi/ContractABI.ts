import { TypeRef } from "../types/types";

export type ContractStruct = {
    name: string;
    header: number;
    fields: ContractField[];
}

export type ContractField = {
    name: string;
    type: TypeRef;
}

export type ContractABI = {
    name: string;
    structs: ContractStruct[];
    code: string;
}