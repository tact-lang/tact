struct LotsOfBools {
    b01: Bool;
    b02: Bool;
    b03: Bool;
    b04: Bool;
    b05: Bool;
    b06: Bool;
    b07: Bool;
    b08: Bool;
    b09: Bool;
    b10: Bool;
}

contract ManyBools {
    flags: LotsOfBools;
    init() {
        self.flags = LotsOfBools{
            b01:true, b02:false, b03:true, b04:false,
            b05:true, b06:false, b07:true, b08:false,
            b09:true, b10:false
        };
    }
    receive() {
        let _ = self.flags.b01;
    }
}