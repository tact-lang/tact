// optional struct with optional fields nested inside non-optional struct
struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Outer {
    inner: Inner;
}

contract Combo {
    x: Outer;

    init() {
        self.x = Outer{ inner: Inner{ foo: null, bar: null } };
    }
}