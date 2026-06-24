struct InnerMost {
    a: Int;
    b: String;
}

struct Middle {
    nested: InnerMost;
    flag: Bool;
}

contract DeepNestedTest {
    data: Middle;

    init() {
        self.data = Middle{
            nested: InnerMost{
                a: 123,
                b: "string",
            },
            flag: true,
        };
    }
}