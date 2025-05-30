struct ComplexSerialization {
    small: Int as uint4;
    med: Int as uint32;
    large: Int as uint128;
    huge: Int as int257;
}

contract SerializationComboTest {
    data: ComplexSerialization;

    init() {
        self.data = ComplexSerialization{
            small: 3,
            med: 100000,
            large: 100000000000000000,
            huge: -2
        };
    }
}
