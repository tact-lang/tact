struct ZeroDefaults {
    x: Int as uint4 = 0;
    y: Int as uint4 = 0;
    z: Int as uint4 = 0;
}

contract SmallIntsWithDefaults {
    sm: ZeroDefaults;

    init() {
        self.sm = ZeroDefaults{
            x: 0,
            y: 0,
            z: 0
        };
    }
}