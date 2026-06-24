struct Mixed {
    a: Int as uint8;
    b: Bool?;
    c: String;
    d: Address;
    e: Cell;
}

contract MixedStruct {
    val: Mixed;

    init() {
        self.val = Mixed{
            a: 255,
            b: null,
            c: "test",
            d: myAddress(),
            e: emptyCell()
        };
    }
}