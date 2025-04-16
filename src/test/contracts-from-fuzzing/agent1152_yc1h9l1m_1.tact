struct Nested {
    inner: DeepInner;
}

struct DeepInner {
    val: Int;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ inner: DeepInner{ val: 42 } };
    }
}