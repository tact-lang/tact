struct OptionalSerial {
    a: Int? as uint8;
    b: Bool?;
    s: String?;
}

contract OptionalSerialized {
    val: OptionalSerial;
    init() {
        self.val = OptionalSerial{
            a:null, b:null, s:null
        };
    }
}
