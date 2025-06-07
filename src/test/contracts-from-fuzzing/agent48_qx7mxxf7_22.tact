struct S {
    x: Int as uint16;
    y: Int as int32;
    z: Int as uint64;
}

contract SerFormats {
    data: S;

    init() {
        self.data = S{
            x: 12,
            y: -300,
            z: 12345678
        };
    }
}
