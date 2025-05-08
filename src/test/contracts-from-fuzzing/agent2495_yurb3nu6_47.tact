struct Weird {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

struct WrapWeird {
    w: Weird?;
}

contract OptionalWeirdWrap {
    inner: WrapWeird;

    init() {
        self.inner = WrapWeird{ w: null };
    }
}