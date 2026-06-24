struct Nested {
    val1: Int;
    val2: Bool;
    sub: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            val1: 1,
            val2: false,
            sub: Inner{ a: 7, b: true }
        };
    }
}