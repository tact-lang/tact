struct OptInner {
    x: Int?;
}

struct Outer {
    a: OptInner?;
    b: OptInner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            a: OptInner{ x: null },
            b: null,
        };
    }
}
