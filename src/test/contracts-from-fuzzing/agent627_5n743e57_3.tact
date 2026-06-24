struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner;
}

contract NestedStructStorage {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{ val: 42 } };
    }
}
