struct InnerMost {
    a: Int;
    b: Bool;
}

struct Mid {
    nested: InnerMost;
    c: String;
}

struct Top {
    mid: Mid;
    d: Bool?;
}

contract DeepNestedTest {
    val: Top;

    init() {
        self.val = Top{
            mid: Mid{
                nested: InnerMost{ a: 1, b: false },
                c: "test"
            },
            d: null
        };
    }
}