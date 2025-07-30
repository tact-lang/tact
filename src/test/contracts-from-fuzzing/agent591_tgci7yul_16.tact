struct SerialTest {
    x: Int as uint1;
    y: Int as uint4;
    z: Int as int16;
}

contract SerialContract {
    data: SerialTest;
    init() {
        self.data = SerialTest{ x: 1, y: 7, z: -8 };
    }
}