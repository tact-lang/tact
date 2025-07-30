struct Packed {
    x: Int as int16;
    y: Int as uint8;
    z: Bool;
}

contract TestContract {
    p: Packed;

    init() {
        self.p = Packed{
            x: -123,
            y: 250,
            z: true
        };
    }
}