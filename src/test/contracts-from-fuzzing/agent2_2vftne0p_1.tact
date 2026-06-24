struct Complex {
    inner: Nested;
    flag: Bool;
    count: Int;
}

struct Nested {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            inner: Nested{ val1: 1, val2: false },
            flag: true,
            count: 42,
        };
    }
}