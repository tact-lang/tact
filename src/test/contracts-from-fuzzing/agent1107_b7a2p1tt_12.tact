struct S1 {
    a: Int;
}

struct S2 {
    x: Bool;
    s1: S1;
}

contract OverlapTest {
    field1: S1;
    field2: S2;
    
    init() {
        self.field1 = S1{a: 7};
        self.field2 = S2{x:true, s1:S1{a: 8}};
    }
}