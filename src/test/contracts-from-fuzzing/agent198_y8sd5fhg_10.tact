struct Inner {
    val: Int;
}

struct Container {
    a: Inner?;
    b: Inner?;
    c: Inner?;
}

contract MultiOptionalStructFields {
    state: Container;

    init() {
        self.state = Container{
            a: null,
            b: null,
            c: null
        };
    }
}
