struct S1 {
    f1: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
    s1c: S1;
    s1d: S1;
}

contract ManyNested {
    storage: S2;
    
    init() {
        self.storage = S2{
            s1a: S1{f1:1},
            s1b: S1{f1:2},
            s1c: S1{f1:3},
            s1d: S1{f1:4},
        };
    }
}