struct Data {
    x: Int as uint8 = 1;
    y: Int as uint16 = 2;
    z: Int as uint32 = 3;
}

contract TestContract {
    v: Data;

    init() {
        self.v = Data{ x: 10, y: 20, z: 30 };
    }
}