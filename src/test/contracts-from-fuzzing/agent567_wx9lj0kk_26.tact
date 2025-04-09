// Chain of nested structs with no defaults, all initialized only in init
struct S4 { v: Int; }
struct S3 { s4: S4; }
struct S2 { s3: S3; }
struct S1 { s2: S2; }

contract NestedAll {
    s1: S1;
    init() {
        self.s1 = S1 {
            s2: S2 {
                s3: S3 {
                    s4: S4 {
                        v: 777
                    }
                }
            }
        };
    }
}
