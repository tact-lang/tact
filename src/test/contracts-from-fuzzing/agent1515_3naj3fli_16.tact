struct SerialOpts {
    si8: Int as int8;
    ui8: Int as uint8;
    boolOpt: Bool?;
    textOpt: String?;
}

contract MixedSerialization {
    mix: SerialOpts;

    init() {
        self.mix = SerialOpts{
            si8: -128,
            ui8: 255,
            boolOpt: null,
            textOpt: null,
        };
    }
}