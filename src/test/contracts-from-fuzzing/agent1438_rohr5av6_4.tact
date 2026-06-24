struct AllTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
}

contract ManyTypes {
    v: AllTypes;

    init() {
        self.v = AllTypes{
            i: 1,
            b: true,
            s: "abc",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
        };
    }
}