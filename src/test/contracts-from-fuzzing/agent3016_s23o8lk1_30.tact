struct PrimitiveSer {
    x: Int as uint32;
    y: Int as int64;
    z: Int as uint1;
}

contract TestContract {
    s: PrimitiveSer;

    init() {
        self.s = PrimitiveSer{
            x: 10,
            y: -20,
            z: 1
        };
    }
}