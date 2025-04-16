struct Complex {
    a: Int;
    inner: Inner;
    b: Bool;
}

struct Inner {
    flag: Bool;
    text: String;
    optInt: Int?;
}

contract Test {
    c: Complex;
    init() {
        self.c = Complex{
            a: 42,
            inner: Inner{ flag: false, text: "nested", optInt: null },
            b: true
        };
    }
}