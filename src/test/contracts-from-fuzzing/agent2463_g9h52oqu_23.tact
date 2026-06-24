struct OptionalInts {
    i1: Int?;
    i2: Int?;
    i3: Int?;
}

struct OptionalBools {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
}

contract GroupsOptional {
    ints: OptionalInts = OptionalInts { i1: null, i2: null, i3: null };
    bools: OptionalBools = OptionalBools { b1: null, b2: null, b3: null };

    init() {}
}
