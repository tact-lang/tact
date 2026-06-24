struct S1 {
    v: Int;
}

struct S2 {
    v: Int?;
}

contract StructMixDefault {
    s1: S1 = S1{v:0};
    s2: S2 = S2{v:null};
}