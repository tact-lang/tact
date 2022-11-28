export type TypeDescription = {
    kind: 'struct' | 'primitive' | 'contract';
    name: string;
    fields: { [key: string]: FieldDescription };
}

export type FieldDescription = {
    name: string,
    type: TypeDescription
}