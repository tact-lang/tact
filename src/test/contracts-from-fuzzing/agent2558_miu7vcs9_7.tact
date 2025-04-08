struct NestedOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct ContainsNestedOpt {
    d: NestedOpt?;
    e: Int;
}

contract OptionalNesting {
    val: ContainsNestedOpt;

    init() {
        self.val = ContainsNestedOpt{
            d: NestedOpt{
                a: null,
                b: "hi",
                c: false,
            },
            e: 77,
        };
    }
}