struct InnerMost {
    x: Int;
    y: Bool;
}

struct Middle {
    val: InnerMost?;
}

struct Top {
    middle: Middle;
    flag: Bool;
}

contract OptionalNestedFields {
    data: Top;

    init() {
        self.data = Top{ middle: Middle{ val: null }, flag: false };
    }
}