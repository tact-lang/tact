struct Inner {
    m: Int?;
    n: Bool?;
}

struct Combo {
    a: Int;
    b: Bool;
    c: String;
    inner: Inner;
}

contract TestContract {
    data: Combo;

    init() {
        self.data = Combo{
            a: 1,
            b: true,
            c: "hi",
            inner: Inner{ m: null, n: false }
        };
    }
}