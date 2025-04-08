struct Nested { inner: Int; }

contract TestContract {
    single: Nested;

    init() {
        self.single = Nested{ inner: 42 };
    }
}