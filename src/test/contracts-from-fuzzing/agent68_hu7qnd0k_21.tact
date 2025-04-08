struct Extremes {
    ui8_max: Int as uint8;
    i8_min: Int as int8;
    i8_max: Int as int8;
}

contract IntExtremes {
    e: Extremes;

    init() {
        self.e = Extremes{
            ui8_max: 255,
            i8_min: -128,
            i8_max: 127
        };
    }
}
