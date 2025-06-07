struct Triple {
    a: Int;
    b: Bool?;
    c: Cell;
}

struct Wrapper {
    x: Triple;
    y: Int;
}

contract Test {
    wrap: Wrapper;
    init() {
        self.wrap = Wrapper{
            x: Triple{ a: 5, b: null, c: emptyCell() },
            y: 123
        };
    }
}