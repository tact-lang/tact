struct SerializeTest {
    a: Int as int8;
    b: Int as uint4;
}

contract StructSerialization {
    v: SerializeTest;

    init() {
        self.v = SerializeTest{ a: -7, b: 8 };
    }
}