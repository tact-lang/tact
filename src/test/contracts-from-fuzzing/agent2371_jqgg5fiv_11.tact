struct Sub {
    a: Int?;
    b: Bool;
    c: Slice;
}

struct Container {
    x: Int;
    y: Cell;
    z: Sub;
}

contract MixedContainer {
    data: Container;

    init() {
        self.data = Container{
            x: 13,
            y: emptyCell(),
            z: Sub { a: null, b: false, c: emptyCell().asSlice() },
        };
    }
}