struct MidNested {
    foo: InnerMost;
    bar: Int;
}

struct InnerMost {
    x: Int;
    y: Bool;
}

contract DeepNesting3 {
    v: MidNested;

    init() {
        self.v = MidNested{
            foo: InnerMost{ x:1, y:true },
            bar: 42
        };
    }
}