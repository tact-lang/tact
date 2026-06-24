struct MiddleNested {
    s: String?;
    f: Bool;
}

struct OuterNested {
    m: MiddleNested?;
}

contract OptionalMiddle {
    outer: OuterNested;

    init() {
        self.outer = OuterNested{
            m: MiddleNested{ s: null, f: true }
        };
    }
}
