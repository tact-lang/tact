struct MultiTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    sl: Slice;
}

contract VariedFields {
    data: MultiTypes;
    init() {
        self.data = MultiTypes{
            i: 10,
            b: true,
            s: "hello",
            c: emptyCell(),
            a: myAddress(),
            sl: emptyCell().asSlice()
        };
    }
}