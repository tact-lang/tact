struct ManyFields {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;
    slice: Slice;
}

contract TestContract {
    m: ManyFields;

    init() {
        self.m = ManyFields{
            i: 42,
            b: false,
            s: "hi",
            c: emptyCell(),
            addr: myAddress(),
            slice: emptyCell().asSlice(),
        };
    }
}