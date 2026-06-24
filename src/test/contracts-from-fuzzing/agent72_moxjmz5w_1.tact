struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    a: Int;
    b: Inner;
    c: Int?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: 1,
            b: Inner{ x:2, y: null },
            c: null
        };
    }
}