struct InnerInner {
    val: Int;
    flag: Bool;
}

struct InnerOuter {
    nested: InnerInner;
    text: String;
}

struct Outer {
    inner: InnerOuter;
    number: Int;
}

contract DeepStructs {
    s: Outer;

    init() {
        self.s = Outer{
            inner: InnerOuter{
                nested: InnerInner{
                    val: 99,
                    flag: false,
                },
                text: "test",
            },
            number: 42,
        };
    }
}
