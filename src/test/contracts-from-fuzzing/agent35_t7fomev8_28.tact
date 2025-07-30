struct Complex {
    a: Int;
    b: Inner?;
    c: String;
    d: Bool?;
    e: Inner2;
}

struct Inner {
    x: Int?;
    y: Bool;
}

struct Inner2 {
    m: Int;
    n: Bool?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: Inner { x: null, y: true },
            c: "abc",
            d: false,
            e: Inner2 { m: 5, n: null }
        };
    }
}
