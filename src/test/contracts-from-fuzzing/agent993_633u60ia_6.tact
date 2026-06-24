struct MixedTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
}

contract TestContract {
    val: MixedTypes;

    init() {
        self.val = MixedTypes{
            i: 42,
            b: true,
            s: "test",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}