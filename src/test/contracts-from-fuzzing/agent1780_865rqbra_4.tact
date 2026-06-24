struct ComplexSerialization {
    smallUnsigned: Int as uint4;
    mediumUnsigned: Int as uint64;
    smallSigned: Int as int1;
    bigSigned: Int as int257;
}

contract SerializationTest {
    complex: ComplexSerialization;

    init() {
        self.complex = ComplexSerialization{
            smallUnsigned: 3,
            mediumUnsigned: 123456789,
            smallSigned: -1,
            bigSigned: -1234567890123456789
        };
    }
}