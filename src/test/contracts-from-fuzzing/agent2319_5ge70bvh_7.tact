struct SerializationTest {
    a: Int as uint4;
    b: Int as int64;
    c: Bool;
    d: Int as int257;
    e: Bool?;
    f: Int?;
    g: String;
}

contract TestContract {
    data: SerializationTest;

    init() {
        self.data = SerializationTest{
            a: 7,
            b: -12,
            c: true,
            d: 123456,
            e: null,
            f: 789,
            g: "serialize",
        };
    }
}
