struct ManyTypes {
    x: Int;
    y: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract ManyPrimitiveTypes {
    val: ManyTypes;

    init() {
        self.val = ManyTypes{
            x: 7,
            y: true,
            s: "hi",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            a: myAddress()
        };
    }
}