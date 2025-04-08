struct Inner {
    x: Int;
    y: Int;
}

struct Wrapper {
    inner: Inner;
    opt: Int?;
}

contract StructCombo {
    a: Wrapper;
    b: Wrapper;
    init() {
        self.a = Wrapper{
            inner: Inner{ x:1, y:2 },
            opt: null
        };
        self.b = Wrapper{
            inner: Inner{ x:3, y:4 },
            opt: 42
        };
    }
}