struct Zero {
    a: Int as uint8;
    b: Int as uint8;
}

contract LargeSerialization {
    data: Zero;

    init() {
        self.data = Zero{a: 255, b: 255};
    }
}