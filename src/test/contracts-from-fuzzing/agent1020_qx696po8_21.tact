struct SerializeTest {
    small: Int as uint8;
    smaller: Int as int4;
    big: Int as uint64;
}

contract SerializationVarTest {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{ small: 1, smaller: 2, big: 3 };
    }
}