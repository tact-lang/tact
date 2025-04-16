struct SerializationTest {
    a: Int as uint3;
    b: Int as uint7;
    c: Int as int12;
}

contract SerializationSizes {
    p: SerializationTest;

    init() {
        self.p = SerializationTest{
            a:3,
            b:65,
            c:100
        };
    }
}
