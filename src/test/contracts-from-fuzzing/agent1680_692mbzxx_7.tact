struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    i: Inner;
    f: Bool = false;
}

contract OptionalNest {
    store: Outer = Outer{
        i: Inner{},  // all null optionals
        f: true
    };
    receive() {}
}