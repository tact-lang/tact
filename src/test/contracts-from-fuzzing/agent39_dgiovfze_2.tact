struct DeepNested {
    x: Int;
    y: Int?;
}

struct Middle {
    d1: DeepNested;
    d2: DeepNested;
}

contract Test {
    nest: Middle;

    init() {
        self.nest = Middle{
            d1: DeepNested{ x: 10, y: null },
            d2: DeepNested{ x: 20, y: 30 }
        };
    }
}
