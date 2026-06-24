struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    z: Cell;
}

contract NestedStructFields {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{x: 1, y: false},
            z: emptyCell()
        };
    }
}