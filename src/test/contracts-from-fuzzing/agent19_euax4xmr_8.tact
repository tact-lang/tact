struct Inner {
    foo: Int?;
}

struct Outer {
    bar: Inner?;
}

contract Test {
    data: Outer?;

    init() {
        self.data = null;
    }
}