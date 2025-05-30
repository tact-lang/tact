struct S1 {
    b: Bool;
}

struct S2 {
    s1_a: S1;
    s1_b: S1;
}

struct S3 {
    s2_a: S2;
    s2_b: S2;
}

contract TestContract {
    deep: S3;
    init() {
        self.deep = S3{
            s2_a: S2{
                s1_a:S1{b:true},
                s1_b:S1{b:false}
            },
            s2_b: S2{
                s1_a:S1{b:true},
                s1_b:S1{b:true}
            }
        };
    }
}