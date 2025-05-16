struct SerializationVariants {
    a: Int as uint8;
    b: Int as int8;
    c: Int as coins;
    d: String;
    e: Address;
    f: Cell;
    g: Slice;
}

contract SerializedStructStorage {
    data: SerializationVariants;

    init() {
        self.data = SerializationVariants{
            a: 255,
            b: -128,
            c: 0,
            d: "test",
            e: myAddress(),
            f: emptyCell(),
            g: emptyCell().asSlice(),
        };
    }
}