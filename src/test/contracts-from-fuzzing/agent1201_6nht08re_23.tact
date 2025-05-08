// deeply nested inside struct default values
struct InnerMost {
    x: Int = 1;
}

struct Inner2 {
    im: InnerMost = InnerMost{};
}

struct Inner1 {
    i2: Inner2 = Inner2{};
}

contract DefaultNest {
    foo: Inner1;

    init() {
        self.foo = Inner1{};
    }
}