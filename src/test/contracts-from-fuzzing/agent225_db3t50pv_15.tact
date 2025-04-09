struct S {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
}

contract StructInContract {
    data: S;

    init() {
        self.data = S{
            i: 1,
            b: true,
            s: "hi",
            c: emptyCell(),
            a: myAddress(),
        };
    }
}