struct DeepNested {
    foo: String;
    bar: Int?;
}

struct MidLevel {
    one: DeepNested;
    two: String?;
}

struct TopLevel {
    alpha: MidLevel;
    beta: Int;
}

contract NestedStructs {
    s: TopLevel;
    init() {
        self.s = TopLevel{
            alpha: MidLevel{
                one: DeepNested{ foo: "abc", bar: null },
                two: "def"
            },
            beta: 42
        };
    }
}
