struct Nested { inner: Int; opt: Bool? }

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{ inner: 123, opt: true };
    }
}