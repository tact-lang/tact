struct Packed {
    x: Int as uint32;
    y: Int as int64;
    z: Bool;
}

contract TestContract {
    p: Packed;

    init() {
        self.p = Packed{
            x: 100,
            y: -50,
            z: true
        };
    }
}