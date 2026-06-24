struct DeepNested {
    val: Int;
    opt: Bool?;
}

struct Middle {
    d: DeepNested;
    text: String;
    f: Bool;
}

struct Outer {
    m: Middle;
    num: Int;
}

contract ComplexNestedTest {
    nested: Outer;

    init() {
        self.nested = Outer{
            m: Middle{
                d: DeepNested{
                    val: 42,
                    opt: null,
                },
                text: "hi",
                f: true,
            },
            num: 7,
        };
    }
}