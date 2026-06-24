struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    s: S1;
    z: String;
}

contract Combo {
    f: S2;

    init() {
        self.f = S2{ s:S1{x:1,y:true}, z:"z" };
    }
}
