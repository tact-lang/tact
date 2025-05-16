struct NestedSerial {
    x: Int as uint8;
    y: Bool;
}

struct OuterSerial {
    a: NestedSerial;
    b: Int as uint32;
}

contract SerialNested {
    data: OuterSerial;

    init() {
        self.data = OuterSerial{
            a: NestedSerial{
                x: 200,
                y: true,
            },
            b: 12345,
        };
    }
}
