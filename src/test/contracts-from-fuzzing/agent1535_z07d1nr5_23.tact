struct InnerSz {
    a: Int as uint8;
    b: Int as uint16;
}

struct OuterSz {
    nested: InnerSz;
    name: String;
    flag: Bool;
}

contract PersistNestSz {
    state: OuterSz = OuterSz{
        nested: InnerSz{a: 5, b: 500},
        name: "nested",
        flag: true,
    };
}
