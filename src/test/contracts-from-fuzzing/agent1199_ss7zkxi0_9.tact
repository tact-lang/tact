struct Inner {
    i: Int;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = null;
    }
}