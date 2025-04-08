struct Inner {
    val: Int;
}

struct Outer {
    nested: Inner?;
}

contract Test12 {
    data: Outer?;

    init() {
        self.data = null;
    }
}
