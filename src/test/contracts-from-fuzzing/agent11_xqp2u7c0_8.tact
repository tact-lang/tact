struct SerializeHintStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Bool;
    d: Address;
    e: Cell;
}

contract SerializeHintContract {
    s: SerializeHintStruct;

    init() {
        self.s = SerializeHintStruct{
            a: 255,
            b: -1234,
            c: true,
            d: myAddress(),
            e: emptyCell()
        };
    }
}