struct SType {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
}

contract SeqAssignment {
    data: SType;

    init() {
        self.data = SType{
            i: 10,
            b: true,
            s: "abc",
            c: emptyCell(),
            a: myAddress()
        };
    }
}