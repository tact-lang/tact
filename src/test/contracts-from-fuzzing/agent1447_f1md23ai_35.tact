struct Tiny {
    x: Int as uint1;
    y: Int as uint1;
    z: Int as uint1;
}

contract PackedTiny {
    t: Tiny;
    
    init() {
        self.t = Tiny{ x:1, y:0, z:1 };
    }
}