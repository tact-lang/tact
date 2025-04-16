// Single optional nested struct, default null field
struct Inner {
    a: Int?;
}

struct Outer {
    inner: Inner;
    flag: Bool?;
}

contract Test {
    outer: Outer;

    init() {
        self.outer = Outer{
            inner: Inner{
                a: null,
            },
            flag: null,
        };
    }
}