struct Numbers {
    tiny: Int as uint4;
    small: Int as int8;
    medium: Int as uint32;
    big: Int as int256;
}

contract SerializationTest {
    data: Numbers;

    init() {
        self.data = Numbers{
            tiny: 5,
            small: -5,
            medium: 123456,
            big: -123456789
        };
    }
}