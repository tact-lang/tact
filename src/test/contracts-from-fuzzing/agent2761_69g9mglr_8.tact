struct S1 { a: Int; }

struct S2 {
    x: S1;
    y: S1;
    z: S1;
}

contract NestedStructsRepetition {
    s2: S2;
    
    init() {
        self.s2 = S2{
            x: S1{a:1},
            y: S1{a:2},
            z: S1{a:3}
        };
    }
}
