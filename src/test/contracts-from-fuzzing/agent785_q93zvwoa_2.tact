struct InnerMost {
    flag: Bool;
}

struct Inner {
    nested: InnerMost;
    txt: String;
}

struct Outer {
    deep: Inner;
    number: Int;
}

contract TestNested {
    data: Outer;

    init() {
        self.data = Outer{
            deep: Inner{
                nested: InnerMost{
                    flag: true,
                },
                txt: "hello",
            },
            number: 42,
        };
    }
}