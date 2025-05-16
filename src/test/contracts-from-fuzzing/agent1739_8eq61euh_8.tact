struct SerializationTest {
    bigInt: Int as int257;
    smallInt: Int as int8;
    uval: Int as uint64;
    flagTrue: Bool;
    flagFalse: Bool;
}

contract Test {
    data: SerializationTest;

    init() {
        self.data = SerializationTest{
            bigInt: 1,
            smallInt: 2,
            uval: 3,
            flagTrue: true,
            flagFalse: false
        };
    }
}
