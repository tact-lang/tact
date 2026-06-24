struct Inner {
    n: Int;
    a: Address;
    c: Cell;
    s: Slice;
    b: Bool;
    str: String;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            n: 1,
            a: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
            b: true,
            str: "hello"
        };
    }
}