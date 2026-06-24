struct S {
    x: Int as int8;
    y: Int as uint8;
    z: Bool;
}

contract SmallIntsMix {
    data: S;
    init() {
        self.data = S{
            x: -128,
            y: 255,
            z: true
        };
    }
}