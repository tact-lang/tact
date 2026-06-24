struct Inner1 {
    foo: Int;
}

struct Inner2 {
    bar: Bool;
}

struct Outer {
    one: Inner1;
    two: Inner2;
}

contract MultiNested {
    v: Outer;

    init() {
        self.v = Outer{
            one: Inner1{ foo: 1 },
            two: Inner2{ bar: true },
        };
    }
}
