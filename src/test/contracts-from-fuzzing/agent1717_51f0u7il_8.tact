struct Inner {
    s: String;
    c: Cell;
}

struct Outer {
    f1: Cell;
    nested: Inner;
    f2: Address?;
}

contract TestContract {
    big: Outer;

    init() {
        self.big = Outer{
            f1: emptyCell(),
            nested: Inner{ s: "abc", c: emptyCell() },
            f2: null,
        };
    }
}