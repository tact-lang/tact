struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1_1: S1;
    s1_2: S1;
    s1_3: S1;
    s1_4: S1;
}

contract MultipleNested {
    nested: S2;

    init() {
        self.nested = S2{
            s1_1: S1{a:1,b:true},
            s1_2: S1{a:2,b:false},
            s1_3: S1{a:3,b:true},
            s1_4: S1{a:4,b:false}
        };
    }
}