struct DeepNested {
    x: Int;
    y: Bool;
}

struct Middle {
    left: DeepNested;
    right: DeepNested;
}

contract Test {
    nested: Middle;

    init() {
        self.nested = Middle{
            left: DeepNested{ x: 1, y: true },
            right: DeepNested{ x: 2, y: false }
        };
    }
}
