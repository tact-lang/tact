struct Zero {
    x: Int as uint8;
}

struct Max {
    y: Int as int256;
}

contract IntSerialize {
    z1: Zero;
    z2: Max;

    init() {
        self.z1 = Zero{ x: 255 };
        self.z2 = Max { y: 123456789 };
    }
}