struct DeeplyNested {
    x: Middle;
    y: Int;
}

struct Middle {
    m: InnerMost;
    z: String;
}

struct InnerMost {
    a: Int;
    b: Bool;
}

contract DeepNestTest {
    val: DeeplyNested = DeeplyNested{
        x: Middle{ m: InnerMost{ a: 1, b: false }, z: "hi" },
        y: 2
    };

    init() {
        self.val = DeeplyNested{
            x: Middle{ m: InnerMost{ a: 10, b: true }, z: "hello" },
            y: 20
        };
    }
}
