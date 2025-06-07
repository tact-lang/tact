struct SerializationTest {
    x: Int as uint4;
    y: Int;
    z: Int as int8;
}

contract SerializationContract {
    s: SerializationTest;

    init() {
        self.s = SerializationTest{
            x: 5,
            y: 1000,
            z: -15
        };
    }
}