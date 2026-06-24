struct SerialOrder {
    x: Int as uint32;
    y: Int;
    z: Int as int8;
}

contract SerializationOrder {
    data: SerialOrder;
    init() {
        self.data = SerialOrder{
            x: 1000,
            y: -1,
            z: -128,
        };
    }
}