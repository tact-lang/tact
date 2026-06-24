// Nested struct with optional inner and its optional
struct Innermost {
    val: Int?;
}

struct Middle {
    inner: Innermost?;
}

struct Outer {
    middle: Middle?;
}

contract OptionalNesting {
    content: Outer;

    init() {
        self.content = Outer{
            middle: null,
        };
    }
}