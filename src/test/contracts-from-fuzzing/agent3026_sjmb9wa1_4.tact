struct DeepInner {
    a: Int;
    b: Bool;
}

struct Middle {
    x: DeepInner;
    y: DeepInner;
}

contract DeepNested {
    nested: Middle;

    init() {
        self.nested = Middle{
            x: DeepInner{a: 1, b: true},
            y: DeepInner{a: 2, b: false}
        };
    }
}