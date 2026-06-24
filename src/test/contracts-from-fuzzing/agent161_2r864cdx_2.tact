struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    count: Int;
}

contract DeepStore {
    val: Nested;

    init() {
        self.val = Nested{ inner: Inner{ flag: true, count: 42 } };
    }

    receive() {
        self.val = Nested{ inner: Inner{ flag: false, count: 100 } };
    }
}