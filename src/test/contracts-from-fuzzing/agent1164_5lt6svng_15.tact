struct S1 { a: Int }
struct S2 { s: S1 }
struct S3 { s2: S2 }
struct S4 { s3: S3 }
struct S5 { s4: S4 }

contract Deep5Nest {
    s5: S5;

    init() {
        self.s5 = S5{
            s4: S4{
                s3: S3{
                    s2: S2{
                        s: S1{a: 123}
                    }
                }
            }
        };
    }
}
