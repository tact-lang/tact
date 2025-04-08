struct SerialOrder {
    val1: Int as uint8;
    val2: Int as uint4;
    val3: Int as uint16;
    val4: Int as int64;
}

contract SerializationOrderContract {
    data: SerialOrder;

    init() {
        self.data = SerialOrder{
            val1: 12,
            val2: 4,
            val3: 1000,
            val4: -12345678
        };
    }
}