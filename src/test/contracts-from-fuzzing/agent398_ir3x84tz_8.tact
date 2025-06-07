struct Mixed {
    optVal: Int?;
    smallUint: Int as uint8;
    optBool: Bool?;
    smallInt: Int as int16;
}

contract MixedSerOpt {
    stored: Mixed;

    init() {
        self.stored = Mixed{
            optVal: null,
            smallUint: 200,
            optBool: true,
            smallInt: -12345
        };
    }
}