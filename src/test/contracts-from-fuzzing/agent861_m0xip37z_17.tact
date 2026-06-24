struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Mid {
    inner: Inner?;
}

struct Outer {
    mid: Mid?;
}

contract MultiOptionalDeepStruct {
    s: Outer?;

    init() {
        self.s = null;
    }
}
