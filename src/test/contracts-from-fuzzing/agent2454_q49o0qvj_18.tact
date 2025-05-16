struct IntSerialization {
    tiny: Int as uint3;
    small: Int as uint5;
    medium: Int as uint8;
    big: Int as int32;
}

contract IntSerializationTest {
    data: IntSerialization;

    init() {
        self.data = IntSerialization{
            tiny: 3,
            small: 15,
            medium: 200,
            big: -100000,
        };
    }
}