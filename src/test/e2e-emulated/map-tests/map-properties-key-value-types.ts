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

const otherTypes: MapType[] = [];
/*
const otherTypes = [
    { type: "Bool", val1: "true", val2: "false" },
    {
        type: "Cell",
        val1: ...
        val2: ...
    },
    // TODO
    // struct
    { type: "S", val1: "", val2: "" },
    // message
    { type: "M", val1: "", val2: "" },
];
*/

export const keyTypes = ints.concat(uints, [address]);
export const valTypes = allInts.concat(otherTypes, [address]);

// export const keyTypes = [address];
// export const valTypes = [address];
