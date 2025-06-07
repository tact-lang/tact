struct Inner {
    a: Int;
    b: Bool;
}

struct Container {
    opt1: Inner?;
    opt2: Inner?;
}

contract OptionalNestedStruct {
    s: Container;

    init() {
        self.s = Container{
            opt1: null,
            opt2: Inner{
                a: 10,
                b: false
            }
        };
    }
}
