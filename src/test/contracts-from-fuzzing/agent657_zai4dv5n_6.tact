struct VariousTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    adr: Address;
}

contract TestContract {
    field: VariousTypes;

    init() {
        self.field = VariousTypes{
            i: 1,
            b: true,
            s: "hi",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            adr: myAddress()
        };
    }
}