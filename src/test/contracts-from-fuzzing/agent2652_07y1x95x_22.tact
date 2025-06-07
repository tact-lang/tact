struct IntSerialization {
    small: Int as uint4;
    med: Int as uint32;
    large: Int as int257;
}

contract SerializationEdgeTest {
    store: IntSerialization;
    init() {
        self.store = IntSerialization{ small: 15, med: 123456789, large: -5 };
    }
}