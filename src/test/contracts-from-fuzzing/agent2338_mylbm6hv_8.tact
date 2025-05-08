struct SerializeTest {
    a: Int as uint3;
    b: Int as int5;
    c: Int as uint7;
    d: Int as int10;
}

contract Serializer {
    test: SerializeTest;

    init() {
        self.test = SerializeTest{a: 3, b: -5, c: 100, d: -50};
    }
}