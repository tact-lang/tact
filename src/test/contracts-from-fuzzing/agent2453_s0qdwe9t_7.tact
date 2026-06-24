struct SerialTest {
    s1: Int as int64;
    s2: Int as uint32;
    s3: Bool;
    s4: String;
}

contract SerialTestContract {
    f: SerialTest;
    init() {
        self.f = SerialTest{
            s1: 12345,
            s2: 12345,
            s3: true,
            s4: "ser"
        };
    }
}