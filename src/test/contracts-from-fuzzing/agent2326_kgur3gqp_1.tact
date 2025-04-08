struct Inner {
    a: Int;
    b: Bool;
    c: Cell;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{
            a: 5,
            b: true,
            c: emptyCell(),
        };
    }
}