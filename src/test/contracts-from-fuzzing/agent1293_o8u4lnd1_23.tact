struct Inner {
    note: String?;
}

struct Complex {
    s: String;
    c: Cell;
    inner: Inner;
}

contract MixedStore {
    data: Complex;

    init() {
        self.data = Complex{
            s: "hi",
            c: emptyCell(),
            inner: Inner{ note: null }
        };
    }
}