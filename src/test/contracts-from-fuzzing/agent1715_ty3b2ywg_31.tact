struct Inner {
    c: Cell;
    i: Int;
    s: String;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            c: emptyCell(),
            i: 99,
            s: "hello"
        };
    }
}