export type ContractAbi = {
    readonly name: string | undefined
    readonly errors: AbiErrors | undefined
    readonly receivers: readonly AbiReceiver[] | undefined
    readonly types: readonly AbiType[] | undefined
    readonly getters: readonly AbiGetter[] | undefined
};

export type AbiErrors = Readonly<Record<string, AbiError>>
export type AbiError = {
    readonly message: string
};

export type AbiReceiver = {
    readonly receiver: 'internal' | 'external';
    readonly message: AbiReceiverMessage;
}
export type AbiReceiverMessage =
    | AbiReceiverMessageTyped
    | AbiReceiverMessageAny
    | AbiReceiverMessageEmpty
    | AbiReceiverMessageText
export type AbiReceiverMessageTyped = {
    readonly kind: 'typed',
    readonly type: string
}
export type AbiReceiverMessageAny = {
    readonly kind: 'any',
}
export type AbiReceiverMessageEmpty = {
    readonly kind: 'empty',
}
export type AbiReceiverMessageText = {
    readonly kind: 'text',
    readonly text: string | undefined
}

export type AbiType = {
    readonly name: string,
    readonly header: number | undefined,
    readonly fields: readonly AbiField[],
};
export type AbiField = {
    readonly name: string,
    readonly type: AbiTypeRef
}

export type AbiGetter = {
    readonly name: string,
    readonly methodId: number | undefined;
    readonly arguments: readonly AbiArgument[] | undefined;
    readonly returnType: AbiTypeRef | undefined;
}
export type AbiArgument = {
    readonly name: string,
    readonly type: AbiTypeRef
}

export type AbiTypeRef =
    | AbiTypeRefSimple
    | AbiTypeRefDict;
export type AbiTypeRefSimple = {
    readonly kind: 'simple',
    readonly type: string,
    readonly optional: boolean,
    readonly format: string | number | boolean,
}
export type AbiTypeRefDict = {
    readonly kind: 'dict',
    readonly format: DictValue,
    readonly key: string,
    readonly keyFormat: DictValue,
    readonly value: string,
    readonly valueFormat: DictValue,
}
export type DictValue = string | number | boolean | undefined