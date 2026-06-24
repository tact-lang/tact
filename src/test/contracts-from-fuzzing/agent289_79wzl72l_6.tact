struct Inner {
    a: Int;
    b: String;
    c: Bool;
}

struct Container {
    one: Inner;
    two: Inner;
    three: Inner;
}

contract MultiNestedSameStruct {
    st: Container;

    init() {
        self.st = Container{
            one: Inner{ a: 1, b: "x", c: true },
            two: Inner{ a: 2, b: "y", c: false },
            three: Inner{ a: 3, b: "z", c: true }
        };
    }
}