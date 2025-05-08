struct Nested {
    inner: Inner?;
}

struct Inner {
    n: Int;
    flag: Bool;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{ inner: Inner{ n: 5, flag: true } };
    }
}