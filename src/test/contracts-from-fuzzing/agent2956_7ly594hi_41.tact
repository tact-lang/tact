struct NestedOptA {
    na: NestedOptB?;
    x: Int?;
}

struct NestedOptB {
    nb: NestedOptC?;
    y: Bool?;
}

struct NestedOptC {
    s: String?;
}

contract DeepOptionalChain {
    chain: NestedOptA;

    init() {
        self.chain = NestedOptA{
            na: null,
            x: null,
        };
    }
}
