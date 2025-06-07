struct Inner {
    foo: Int?;
}

struct Outer {
    bar: Inner;
    baz: Bool;
}

contract OptionalInit {
    state: Outer;

    init() {
        self.state = Outer{ bar: Inner{ foo: null }, baz: true };
    }
}