struct Inners {
    i1: Inner1;
    i2: Inner2;
}

struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    x: Int?;
    y: String;
}

contract NestedStructTest {
    nested: Inners = Inners{ i1: Inner1{ a: 1, b: false }, i2: Inner2{ x: null, y: "" } };

    init() {
        self.nested = Inners{ i1: Inner1{ a: 2, b: true }, i2: Inner2{ x: 3, y: "abc" } };
    }
}
