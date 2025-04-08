struct SerializeTest {
    sn: Int as int64;
    un: Int as uint32;
    b: Bool;
    s: String;
}

contract SerializationFields {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{
            sn: -21,
            un: 42,
            b: true,
            s: "hi"
        };
    }

    receive() {
        let _ = self.data.s;
    }
}