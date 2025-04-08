struct OptSerial {
    a: Int? as uint32;
    b: Bool?;
    c: String?;
}

contract ComboOpts {
    val: OptSerial;
    init() {
        self.val = OptSerial{
            a:null, b:null, c:null
        };
    }
}
