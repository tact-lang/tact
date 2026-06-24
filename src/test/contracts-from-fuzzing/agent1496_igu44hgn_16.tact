struct Data {
    x: Int as uint4;
    y: Int as uint8;
    z: Int as int16;
}

contract TestContract {
    storage: Data;
    init() {
        self.storage = Data{ x: 5, y: 10, z: -20 };
    }
}