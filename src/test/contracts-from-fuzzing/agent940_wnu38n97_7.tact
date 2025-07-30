struct SerializeTest {
    x: Int as uint8;
    y: Int as int16;
    z: Int as uint32;
}

contract TestContract {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{ x: 1, y: -2, z: 3 };
    }
}