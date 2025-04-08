struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct MiddleOptional {
    inner: Inner?;
    flag: Bool;
}

contract OptionalMiddle {
    payload: MiddleOptional;

    init() {
        self.payload = MiddleOptional{
            inner: null,
            flag: false,
        };
    }
}
