struct Inner {
    flag: Bool;
    count: Int;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract OptionalNestedStructs {
    data: Outer;

    init() {
        self.data = Outer{ middle: null };
    }
}