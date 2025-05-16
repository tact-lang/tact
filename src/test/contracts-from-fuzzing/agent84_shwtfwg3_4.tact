struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    data: Outer = Outer{ inner: null };

    init() {
        self.data = Outer{ inner: null };
    }
}