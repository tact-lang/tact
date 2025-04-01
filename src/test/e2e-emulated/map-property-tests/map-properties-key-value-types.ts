type MapType = {
    type: string;
    _1: string;
    _2: string;
};

const intSizes = [8, 42, 257];
const uintSizes = [9, 32, 256];

const ints: MapType[] = intSizes.map((size) => ({
    type: `Int as int${size}`,
    _1: "-5n",
    _2: "42n",
}));

const uints: MapType[] = uintSizes.map((size) => ({
    type: `Int as uint${size}`,
    _1: "6n",
    _2: "121n",
}));

const varInts = [
    {
        type: "Int as varint16",
        _1: "-7n",
        _2: "1000n",
    },
    {
        type: "Int as varint32",
        _1: "-74n",
        _2: "10000n",
    },
    {
        type: "Int as varuint16",
        _1: "7n",
        _2: "100n",
    },
    {
        type: "Int as varuint32",
        _1: "740n",
        _2: "100000n",
    },
    {
        type: "Int as coins",
        _1: "7n",
        _2: "100n",
    },
];

const allInts = ints.concat(uints, varInts);

const address = {
    type: "Address",
    _1: 'address("UQBKgXCNLPexWhs2L79kiARR1phGH1LwXxRbNsCFF9doczSI")',
    _2: "new Address(0, Buffer.alloc(32, 0))",
};

const otherValueTypes: MapType[] = [
    { type: "Bool", _1: "true", _2: "false" },
    {
        type: "Cell",
        _1: 'Cell.fromBase64("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=")',
        _2: 'Cell.fromBase64("te6ccgEBAgEALQABDv8AiNDtHtgBCEICGbgzd5nhZ9WhSM+4juFCvgMYJOtxthFdtTKIH6M/6SM=")',
    },
    {
        type: "SomeStruct",
        _1: "{ $$$$type: 'SomeStruct', i: -321n, b: false, a: new Address(0, Buffer.alloc(32, 0)), u1: 10n, u2: 20n }",
        _2: "{ $$$$type: 'SomeStruct', i: -322n, b: true, a: new Address(0, Buffer.alloc(32, 1)), u1: 101n, u2: 202n }",
    },
    {
        type: "SomeMessage",
        _1: "{ $$$$type: 'SomeMessage', nonce: 0n, buyer: new Address(0, Buffer.alloc(32, 2)) }",
        _2: "{ $$$$type: 'SomeMessage', nonce: 56n, buyer: new Address(0, Buffer.alloc(32, 1)) }",
    },
];

export const keyTypes = ints.concat(uints, [address]);
export const valTypes = allInts.concat(otherValueTypes, [address]);
