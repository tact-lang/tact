struct NestedLong {
    a: Int;
    b: DeepOptional;
    c: Int;
}

struct DeepOptional {
    d: String;
    e: InnerMost;
}

struct InnerMost {
    f: Int;
    g: Bool;
    h: Address;
}

contract MultiNested {
    state: NestedLong = NestedLong{
        a: 1,
        b: DeepOptional{
            d: "s",
            e: InnerMost{
                f: 2,
                g: true,
                h: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
            }
        },
        c: 3
    };

    init() {}
}