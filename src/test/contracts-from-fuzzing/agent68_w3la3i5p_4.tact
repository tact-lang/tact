struct S {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            i: 10,
            b: true,
            s: "test",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            a: myAddress()
        };
    }
}