struct SerializedOrder {
    x: Int as uint8;
    y: Int as int16;
    z: Int as coins;
}

contract SerializationOrder {
    s: SerializedOrder;

    init() {
        self.s = SerializedOrder{ x: 255, y: -32768, z: 1000000000 };
    }
}