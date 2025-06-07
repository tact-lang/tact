struct SerialTest {
    i: Int as uint8;
    j: Int as int32;
    k: Int as int257;
    s: String;
    b: Bool;
}

contract Test {
    data: SerialTest;

    init() {
        self.data = SerialTest{
            i: 255,
            j: -12345,
            k: 123456789123456789,
            s: "hello",
            b: true,
        };
    }
}
