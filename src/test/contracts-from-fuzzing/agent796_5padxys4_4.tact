struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    inner: Inner;
    value: Int;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{ a:1, b:null },
            value: 5
        };
    }
}