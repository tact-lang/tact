struct Deeply {
    level: Int;
    deeper: InnerOption?;
}

struct InnerOption {
    value: Int;
    flag: Bool?;
}

contract DeepNest {
    d: Deeply;
    init() {
        self.d = Deeply{
            level: 10,
            deeper: InnerOption{ value: 42, flag: null },
        };
    }
}
