struct SerializeTest {
    x: Int as int64;
    y: Int as uint8;
    z: Bool;
    s: String;
}

contract SerialContract {
    data: SerializeTest;
    
    init() {
        self.data = SerializeTest{
            x: -42,
            y: 255,
            z: true,
            s: "ok"
        };
    }
}