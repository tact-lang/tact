struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
}

struct Outer {
    x: Inner1;
    y: Inner2;
}

contract NestedStructDifferentTypes {
    nested: Outer;
    init() {
        self.nested = Outer{
            x: Inner1{ a: 7 },
            y: Inner2{ b: true },
        };
    }
}