struct Nested {
    inner: Simple;
    value: Int;
}

struct Simple {
    a: Int;
    b: Int;
}

contract TestContract {
    deep: Nested;

    init() {
        self.deep = Nested{ inner: Simple{ a: 5, b: 6 }, value: 10 };
    }
}