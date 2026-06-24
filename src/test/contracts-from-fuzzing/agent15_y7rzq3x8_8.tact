struct S1 { i: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2; }
struct S4 { s3: S3; }
struct S5 { s4: S4; }
struct S6 { s5: S5; }

contract TestContract {
    data: S6;

    init() {
        self.data = S6{
            s5: S5{
                s4: S4{
                    s3: S3{
                        s2: S2{
                            s1: S1{
                                i: 123,
                            },
                        },
                    },
                    
                },
            },
        };
    }
}