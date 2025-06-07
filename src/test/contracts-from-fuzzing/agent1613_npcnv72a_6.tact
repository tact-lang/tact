struct DeepOpt {
    a: Int?;
    b: Inner?;
}

struct Inner {
    c: Bool?;
    d: String?;
    e: Leaf?;
}

struct Leaf {
    f: Int?;
    g: Bool?;
}

contract NestedOptionalStructs {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{
            a: null,
            b: Inner{
                c: null,
                d: null,
                e: Leaf{
                    f: null,
                    g: true,
                },
            },
        };
    }
}
