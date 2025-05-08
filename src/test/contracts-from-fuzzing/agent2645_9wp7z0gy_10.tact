struct A {
    foo: Int;
}

struct B {
    bar: Int;
}

struct Container {
    which: Int;
    a: A?;
    b: B?;
    message: String;
}

contract OptionalSum {
    state: Container;

    init() {
        self.state = Container{
            which: 1,
            a: null,
            b: B{bar: 999},
            message: "hi",
        };
    }
}
