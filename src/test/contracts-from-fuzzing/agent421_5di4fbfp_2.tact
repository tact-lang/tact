struct Nested { a: Int; b: Int; }
struct Container { inner: Nested; c: Int; }

contract Test {
    data: Container;

    init() {
        self.data = Container{ inner: Nested{ a: 1, b: 2 }, c: 3 };
    }
}
