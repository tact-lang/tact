struct SerialOrder {
    a: Int as uint8;
    b: Int;
    c: Int as uint64;
}

contract OrderStorage {
    data: SerialOrder;

    init() {
        self.data = SerialOrder{ a: 1, b: 2, c: 3 };
    }
}