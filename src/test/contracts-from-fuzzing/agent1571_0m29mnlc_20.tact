struct Precision {
    x: Int as int8;
    y: Int as uint16;
    z: Int as int32;
    flag: Bool;
}

contract TestContract {
    data: Precision = Precision{ x: 0, y: 0, z: 0, flag: false };

    init() {
        self.data = Precision{ x: -5, y: 65000, z: -50000, flag: true };
    }
}