struct Mixed {
    a: Int as int1;
    b: Int as uint8;
    c: Int as int16;
    d: Int;
}

contract TestContract {
    mixed: Mixed;

    init() {
        self.mixed = Mixed{a: 1, b: 255, c: -32000, d: 999999999};
    }
}