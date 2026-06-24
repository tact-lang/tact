struct Inner {
    a: Int;
    b: Bool;
}

struct Container {
    c1: Inner;
    c2: Inner;
    str: String;
}

contract WideNestedStruct {
    val: Container = Container {
        c1: Inner { a: 1, b: true },
        c2: Inner { a: 2, b: false },
        str: "xx"
    };

    init() {}
}