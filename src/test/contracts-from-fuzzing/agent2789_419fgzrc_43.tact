struct S4 { a: Int }

struct S3 { s4: S4 }

struct S2 { s3: S3 }

struct S1 { s2: S2 }

contract LevelContract {
    ll: S1;

    init() {
        self.ll = S1{
            s2: S2{
                s3: S3{
                    s4: S4{ a: 4 }
                }
            }
        };
    }
}