struct One {
    x: Int as int8;
    y: Int as uint8;
    z: Int as int32;
}

contract DifferentSerializations {
    data: One;
    init() {
        self.data = One{ x: 1, y: 2, z: 3 };
    }
}