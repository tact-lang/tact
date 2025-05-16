struct SerialOrder {
    first: Int as uint8;
    second: Int as uint16;
    third: Int as int64;
    fourth: Bool;
    fifth: String;
}

contract SerializationChecks {
    val: SerialOrder;

    init() {
        self.val = SerialOrder{
            first: 1,
            second: 511,
            third: 123456789,
            fourth: true,
            fifth: "test",
        };
    }
}