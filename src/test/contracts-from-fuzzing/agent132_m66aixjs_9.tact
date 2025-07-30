// Struct with many optionals nested inside optionals
struct InnerMost {
    a: Int?;
    b: Bool?;
}

struct Mid {
    inner: InnerMost?;
}

struct Outer {
    mid: Mid?;
}

contract NestedOptionals {
    outer: Outer?;

    init() {
        self.outer = Outer{
            mid: Mid{
                inner: null,
            },
        };
    }
}