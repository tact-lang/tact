struct DeepNested {
    one: Int;
    two: Bool?;
}

struct Middle {
    nested: DeepNested;
    optInner: DeepNested?;
}

contract Nesting {
    mid: Middle;
    init() {
        self.mid = Middle{
            nested: DeepNested{ one: 1, two: true },
            optInner: null
        };
    }
    receive() {}
}