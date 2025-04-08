struct SerializationTest {
    x: Int as int4;
    y: Int as uint10;
    z: Int as int64;
}

contract TestContract {
    st: SerializationTest;

    init() {
        self.st = SerializationTest{
            x: -8, y: 1023, z: 99999999
        };
    }
}