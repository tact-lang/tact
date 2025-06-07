struct Inner {
    a: Int?;
    b: Bool;
    c: String;
}

struct Mid {
    nested1: Inner?;
    nested2: Inner;
}

contract OptionalNestTest {
    storage: Mid;

    init() {
        self.storage = Mid{
            nested1: null,
            nested2: Inner{ a: null, b: false, c: "hi" },
        };
    }
}