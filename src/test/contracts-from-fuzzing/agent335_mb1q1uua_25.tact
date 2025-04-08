struct OptionalSerial {
    a: Int? as uint64;
    b: Bool?;
    c: String?;
}

contract OptionalSerialContract {
    data: OptionalSerial;

    init() {
        self.data = OptionalSerial {
            a:null, b:null, c:null
        };
    }
}