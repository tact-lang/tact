struct S1 {
    i: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    s2: S1;
}

contract DoubleEmbed {
    s: S2;

    init() {
        self.s = S2{ s1:S1{i:1,b:true}, s2:S1{i:2,b:false} };
    }
}