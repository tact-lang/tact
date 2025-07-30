struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner?;
}

contract Test {
    data: Outer? = Outer{ inner: null };

    init() {
        self.data = null;
    }
}