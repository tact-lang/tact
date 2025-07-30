struct DeepNested {
    n: Int;
    optSub: SubNested?;
}

struct SubNested {
    b: Bool;
    s: String;
}

contract TestDeepNested {
    d: DeepNested;

    init() {
        self.d = DeepNested{
            n: 42,
            optSub: SubNested{
                b: false,
                s: "deep",
            },
        };
    }
}