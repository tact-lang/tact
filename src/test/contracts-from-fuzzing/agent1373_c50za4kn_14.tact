struct Inner {
    val: Int;
}

struct Outer {
    foo: Inner?;
}

contract Test {
    bar: Outer?;

    init() {
        self.bar = null;
    }
}