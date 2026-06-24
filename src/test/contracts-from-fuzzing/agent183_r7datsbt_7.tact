struct NestedManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Address?;
    nested: DeepOpts?;
}

struct DeepOpts {
    x: Int?;
    b: Bool?;
    s: String?;
    inner: InnerOpts?;
}

struct InnerOpts {
    val: Int?;
    addr: Address?;
}

contract MixedOptionals {
    state: NestedManyOptionals = NestedManyOptionals{
        o1: null,
        o2: null,
        o3: null,
        o4: null,
        o5: null,
        nested: null,
    };

    init() {
        self.state = NestedManyOptionals{
            o1: 1,
            o2: true,
            o3: "X",
            o4: emptyCell(),
            o5: myAddress(),
            nested: DeepOpts{
                x: 7,
                b: false,
                s: "Y",
                inner: InnerOpts{ val: 33, addr: myAddress() },
            },
        };
    }
}