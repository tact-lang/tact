struct Tiny {
    x: Int as uint1;
    y: Int as uint2;
    z: Int as uint3;
}

contract TinyIntsTest {
    t: Tiny;
    
    init() {
        self.t = Tiny{ x:1, y:2, z:3 };
    }
}