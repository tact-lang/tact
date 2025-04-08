struct WithSerialization {
    i1: Int as uint8;
    i2: Int as int16;
    i3: Int as coins;
}

contract SerializeTest {
    data: WithSerialization;

    init() {
        self.data = WithSerialization{ i1:1,i2:2,i3:1000000 };
    }
}