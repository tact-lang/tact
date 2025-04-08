struct NestedOptionals {
    inner1: Int?;
    inner2: String?;
}

struct Mid { nested: NestedOptionals?; }

struct Top {
    foo: Mid?;
    bar: Bool;
}

contract OptionalStructs {
    data: Top;
    init() {
        self.data = Top{
            foo: null,
            bar: true
        };
    }
}