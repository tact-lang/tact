struct S1 {
    x: Int;
}
struct S2 {
    y: Bool?;
}

contract MixedStructOptionals {
    s1: S1;
    s2: S2;

    init() {
        self.s1 = S1{x:1};
        self.s2 = S2{y:null};
    }
}