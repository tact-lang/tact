struct Nested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract Test {
    n: Nested;

    init() {
        self.n = Nested{
            inner: Inner{a: 1, b: true},
            flag: false
        };
    }
}