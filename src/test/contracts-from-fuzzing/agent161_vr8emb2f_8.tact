struct InnerMost {
    val: Int;
}

struct Inner {
    nested: InnerMost;
    flag: Bool;
}

struct OuterMost {
    content: Inner;
    label: String;
}

contract TestDeeplyNested {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            content: Inner{
                nested: InnerMost{
                    val: 999,
                },
                flag: false,
            },
            label: "layer3",
        };
    }
}
