struct Inner {
    x: Int;
}

struct Outer {
    a: Int;
    b: Inner;
    c: Int;
}

contract NestedOptional {
    value: Outer?;
    init() {
        self.value = null;
    }
}