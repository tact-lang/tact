struct LongBooleans {
    b01: Bool; b02: Bool; b03: Bool; b04: Bool; b05: Bool;
    b06: Bool; b07: Bool; b08: Bool; b09: Bool; b10: Bool;
    b11: Bool; b12: Bool; b13: Bool; b14: Bool; b15: Bool;
    b16: Bool; b17: Bool; b18: Bool; b19: Bool; b20: Bool;
    b21: Bool; b22: Bool; b23: Bool; b24: Bool; b25: Bool;
    b26: Bool; b27: Bool; b28: Bool; b29: Bool; b30: Bool;
}

contract ManyBooleansInStruct {
    multiBools: LongBooleans;

    init() {
        self.multiBools = LongBooleans{
            b01: true, b02: false, b03: true, b04: false, b05: true,
            b06: false, b07: true, b08: false, b09: true, b10: false,
            b11: true, b12: false, b13: true, b14: false, b15: true,
            b16: false, b17: true, b18: false, b19: true, b20: false,
            b21: true, b22: false, b23: true, b24: false, b25: true,
            b26: false, b27: true, b28: false, b29: true, b30: false,
        };
    }
}