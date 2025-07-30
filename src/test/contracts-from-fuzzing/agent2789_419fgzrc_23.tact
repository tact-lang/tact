struct SerializationVariants {
    int4: Int as int4;
    uint7: Int as uint7;
    int9: Int as int9;
    uint31: Int as uint31;
}

contract IntSerializationTest {
    val: SerializationVariants;

    init() {
        self.val = SerializationVariants{
            int4: 5,
            uint7: 100,
            int9: -20,
            uint31: 500000
        };
    }
}
