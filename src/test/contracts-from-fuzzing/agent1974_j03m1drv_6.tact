struct S1 { a: Int; }
struct S2 { a: Int; }
struct S3 { s1: S1; s2: S2; }
struct S4 { s3: S3; num: Int; }
struct S5 { s4: S4; flag: Bool; }

contract TestDeep {
    storage: S5;
    
    init() {
        self.storage = S5{
            s4: S4{
                s3: S3{
                    s1: S1{a: 1},
                    s2: S2{a: 2}
                },
                num: 42
            },
            flag: true
        };
    }
}
