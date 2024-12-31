export type MapType = {
    type: string;
    val1: number;
    val2: number;
};

const intSizes = [1, 42, 257];
const uintSizes = [1, 32, 256];

const ints: MapType[] = intSizes.map((size) => ({
    type: `Int as int${size}`,
    val1: -5,
    val2: 42,
}));

const uints: MapType[] = uintSizes.map((size) => ({
    type: `Int as uint${size}`,
    val1: 6,
    val2: 121,
}));

const varInts = [
    {
        type: "Int as varint16",
        val1: -7,
        val2: 1000,
    },
    {
        type: "Int as varint32",
        val1: -74,
        val2: 10000,
    },
    {
        type: "Int as varuint16",
        val1: 7,
        val2: 100,
    },
    {
        type: "Int as varuint32",
        val1: 740,
        val2: 100000,
    },
    {
        type: "Int as coins",
        val1: 7,
        val2: 100,
    },
];

const allInts = ints.concat(uints, varInts);

const address = {
    type: "Address",
    val1: 4,
    val2: 42,
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

//export const keyTypes = ints.concat(uints, [address]);
// export const valTypes = allInts.concat(otherTypes, [address]);

export const keyTypes = [address];
export const valTypes = [address];
