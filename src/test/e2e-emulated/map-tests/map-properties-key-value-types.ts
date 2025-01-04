export type MapType = {
    type: string;
    val1: string;
    val2: string;
};

const intSizes = [8, 42, 257];
const uintSizes = [9, 32, 256];

const ints: MapType[] = intSizes.map((size) => ({
    type: `Int as int${size}`,
    val1: "-5n",
    val2: "42n",
}));

const uints: MapType[] = uintSizes.map((size) => ({
    type: `Int as uint${size}`,
    val1: "6n",
    val2: "121n",
}));

const varInts = [
    {
        type: "Int as varint16",
        val1: "-7n",
        val2: "1000n",
    },
    {
        type: "Int as varint32",
        val1: "-74n",
        val2: "10000n",
    },
    {
        type: "Int as varuint16",
        val1: "7n",
        val2: "100n",
    },
    {
        type: "Int as varuint32",
        val1: "740n",
        val2: "100000n",
    },
    {
        type: "Int as coins",
        val1: "7n",
        val2: "100n",
    },
];

const allInts = ints.concat(uints, varInts);

const address = {
    type: "Address",
    val1: 'address("UQBKgXCNLPexWhs2L79kiARR1phGH1LwXxRbNsCFF9doczSI")',
    val2: "new Address(0, Buffer.alloc(32, 0))",
};

const otherValueTypes: MapType[] = [
    { type: "Bool", val1: "true", val2: "false" },
    {
        type: "Cell",
        val1: 'Cell.fromBase64("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=")',
        val2: 'Cell.fromBase64("te6ccgEBAgEALQABDv8AiNDtHtgBCEICGbgzd5nhZ9WhSM+4juFCvgMYJOtxthFdtTKIH6M/6SM=")',
    },
    {   type: "SomeStruct",
        val1: "{ $$$$type: 'SomeStruct', i: -321n, b: false, a: new Address(0, Buffer.alloc(32, 0)), u1: 10n, u2: 20n }",
        val2: "{ $$$$type: 'SomeStruct', i: -322n, b: true, a: new Address(0, Buffer.alloc(32, 1)), u1: 101n, u2: 202n }",
    }
    // TODO
    // message
    // { type: "M", val1: "", val2: "" },
];

export const keyTypes = ints.concat(uints, [address]);
export const valTypes = allInts.concat(otherValueTypes, [address]);
