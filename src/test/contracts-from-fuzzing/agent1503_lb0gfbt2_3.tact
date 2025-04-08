struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    i: Inner;
    c: String;
}

contract DeepNestedOptional {
    s: Outer;

    init() {
        self.s = Outer { i: Inner { a: 1, b: null }, c: "test" };
    }

    receive() {}
}