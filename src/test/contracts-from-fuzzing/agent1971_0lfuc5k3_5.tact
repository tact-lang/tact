struct InnerMost {
    x: Int;
    y: Bool?;
}

struct Inner {
    a: InnerMost;
    text: String;
}

struct Middle {
    i: Inner;
    number: Int;
}

contract DeepNestedPersistent {
    m: Middle;

    init() {
        self.m = Middle{
            i: Inner{
                a: InnerMost{
                    x: 42,
                    y: true
                },
                text: "hi"
            },
            number: 99
        };
    }
}
