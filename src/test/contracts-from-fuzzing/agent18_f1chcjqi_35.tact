struct OptSerial {
    a: Int as uint8;
    b: Int?;
    c: Bool?;
}

contract OptSerialTest {
    val: OptSerial;
    init() {
        self.val = OptSerial{ a:5, b:null, c:null };
    }
}