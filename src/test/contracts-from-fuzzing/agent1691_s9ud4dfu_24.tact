struct SerializeTest {
    x: Int as int64;
    y: Int as uint32;
    z: Int;
}

contract SerializationContract {
    s: SerializeTest;

    init() {
        self.s = SerializeTest{
            x:123, y:456, z:789
        };
    }
}