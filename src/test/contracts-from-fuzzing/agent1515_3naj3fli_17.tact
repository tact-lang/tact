struct Tiny {
    bit: Bool;
}

struct WithOptionalNested {
    t: Tiny?;
    s: String;
}

contract Fuzzy {
    nestedOpt: WithOptionalNested;

    init() {
        self.nestedOpt = WithOptionalNested{
            t: null,
            s: "hi",
        };
    }
}