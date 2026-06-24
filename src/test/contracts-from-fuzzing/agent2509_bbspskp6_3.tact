struct S1 {
    x: Int;
    y: Bool;
    z: Int?;
}

struct S2 {
    a: S1;
    b: S1;
}

contract DoubleNested {
    s2: S2;

    init() {
        self.s2 = S2{
            a: S1{ x:1, y:true, z:null },
            b: S1{ x:2, y:false, z:null }
        };
    }
}