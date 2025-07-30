struct InnerMost {
    flag: Bool;
    note: String;
}

struct Inner {
    x: Int;
    val: Bool?;
    extra: InnerMost;
}

contract NestDeepTest {
    nested: Inner;

    init() {
        self.nested = Inner{
            x: 42,
            val: null,
            extra: InnerMost{
                flag: false,
                note: "world",
            },
        };
    }
}