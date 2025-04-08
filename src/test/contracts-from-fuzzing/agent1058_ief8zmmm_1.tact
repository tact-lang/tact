struct Nested {
    inner: Inner;
}

struct Inner {
    val: Int;
}

contract TestContract {
    val: Nested;

    init() {
        self.val = Nested{ inner: Inner{ val: 10 } };
    }
}