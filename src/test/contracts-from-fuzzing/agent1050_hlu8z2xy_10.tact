struct S {
    x: Int as uint8;
    y: Int as uint16;
    z: Int as uint32;
    w: Int as int64;
}

contract SerializeTypesTest {
    s: S;

    init() {
        self.s = S{
            x: 1,
            y: 2,
            z: 3,
            w: 4,
        };
    }
}
