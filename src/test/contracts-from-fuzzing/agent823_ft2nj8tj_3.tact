struct InnerMost {
    foo: Int;
    bar: Bool;
}

struct Middle {
    nested: InnerMost;
    optVal: String?;
}

contract DeepNested {
    content: Middle;

    init() {
        self.content = Middle{
            nested: InnerMost{ foo: 1, bar: true },
            optVal: null
        };
    }
}