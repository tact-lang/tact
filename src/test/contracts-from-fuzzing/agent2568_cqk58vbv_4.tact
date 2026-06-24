struct DeepNested {
    a: String;
    b: Bool;
    c: Int;
}

struct MidNested {
    x: DeepNested;
    y: String;
}

struct Top {
    one: MidNested;
    two: MidNested;
}

contract DeepNestedTest {
    val: Top;

    init() {
        self.val = Top{
            one: MidNested{
                x: DeepNested{ a: "a", b: true, c: 1 },
                y: "yy"
            },
            two: MidNested{
                x: DeepNested{ a: "z", b: false, c: 2 },
                y: "zz"
            }
        };
    }
}