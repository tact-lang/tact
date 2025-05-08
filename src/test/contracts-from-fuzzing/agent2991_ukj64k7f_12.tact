struct BoolNest {
    x: Bool;
    y: BoolNest2;
}

struct BoolNest2 {
    z: Bool;
    t: BoolNest3;
}

struct BoolNest3 {
    u: Bool;
    v: BoolNest4;
}

struct BoolNest4 {
    w: Bool;
}

contract Test {
    nested: BoolNest;

    init() {
        self.nested = BoolNest{
            x:true,
            y:BoolNest2{
                z:false,
                t:BoolNest3{
                    u:true,
                    v:BoolNest4{
                        w:false
                    }
                }
            }
        };
    }
}