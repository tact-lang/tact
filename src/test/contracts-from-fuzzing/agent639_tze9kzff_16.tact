struct Inner {
    foo: Int = 2;
    bar: Bool?;
}

struct Outer {
    opt: Inner?;
    baz: Int = 5;
}

contract DefOptAssign {
    state: Outer;

    init() {
        self.state = Outer{
            opt: null, // optional inner struct left as null
            baz: 10,
        };
    }

    receive() {}
}