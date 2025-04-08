struct Inner {
    a: Int;
    b: Bool;
    c: Cell;
}

contract TestContract {
    data: Inner;
    init() {
        self.data = Inner{
            a: 1,
            b: true,
            c: emptyCell(),
        };
    }
}