struct SerializationFormats {
    intVal: Int as int64;
    uintVal: Int as uint64;
    coinVal: Int as coins;
    addr: Address;
    sl: Slice;
    str: String;
    optBool: Bool?;
}

contract SerFormatTest {
    data: SerializationFormats;

    init() {
        self.data = SerializationFormats{
            intVal: -1234,
            uintVal: 1234,
            coinVal: 1000000000,
            addr: myAddress(),
            sl: emptyCell().asSlice(),
            str: "hello",
            optBool: null
        };
    }
}