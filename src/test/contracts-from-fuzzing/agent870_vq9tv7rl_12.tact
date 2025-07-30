struct SerialTest {
    x: Int as uint8;
    y: Int as int16;
    z: Int as coins;
}

contract SerialHolder {
    foo: SerialTest = SerialTest{
        x: 1,
        y: -300,
        z: ton("1")
    };

    init() {
        self.foo = SerialTest{
            x: 200,
            y: -1000,
            z: ton("0.5")
        };
    }
}
