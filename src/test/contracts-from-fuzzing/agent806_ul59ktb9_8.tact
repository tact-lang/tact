struct ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
}

contract MixedTypes {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            i: 1,
            b: true,
            s: "hello",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}