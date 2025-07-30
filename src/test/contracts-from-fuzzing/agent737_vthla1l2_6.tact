struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    c: Cell;
    d: Inner;
    e: Bool?;
    f: Inner?;
}

contract CombinedWide {
    data: Outer;

    init() {
        self.data = Outer{
            c: emptyCell(),
            d: Inner{ a: 1, b: false },
            e: null,
            f: null
        };
    }
}