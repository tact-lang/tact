struct S {
    x: Int as uint4;
    y: Int as uint8;
    z: Int as uint16;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{ x: 7, y: 200, z: 65000 };
    }
}