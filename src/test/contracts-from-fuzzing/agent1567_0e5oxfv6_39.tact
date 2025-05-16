struct SerialOrder {
    a: Int as uint8;
    b: Int as uint32;
    c: Int;
}

contract SerializationOrder {
    s: SerialOrder;

    init() {
        self.s = SerialOrder{
            a:1,b:2,c:3
        };
    }
}