struct ManyTypes {
    b: Bool;
    i: Int;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract TestContract {
    data: ManyTypes;
    init() {
        self.data = ManyTypes{
            b: true,
            i: 42,
            s: "hi",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            a: myAddress(),
        };
    }
}