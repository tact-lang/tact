struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner?;
}

contract Test29 {
    data: Outer?;

    init() {
        self.data = null;
    }
}