struct Tiny {
    x: Int as uint1;
    y: Int as uint2;
    z: Int as uint3;
}

contract SmallInts {
    s: Tiny;
    init() {
        self.s = Tiny{ x:1, y:2, z:3 };
    }
}