struct SerializeStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Bool;
    d: Address;
    e: Cell;
}

contract SerializedStructVars {
    rec: SerializeStruct;

    init() {
        self.rec = SerializeStruct{
            a: 255,
            b: -12345,
            c: true,
            d: myAddress(),
            e: emptyCell()
        };
    }
}