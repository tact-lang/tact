struct BigNestingOptionals {
    s1: S1?;
}

struct S1 {
    s2: S2?;
}

struct S2 {
    s3: S3?;
}

struct S3 {
    s4: S4?;
}

struct S4 {
    endingValue: Int?;
}

contract BigNestingOptionalsContract {
    dat: BigNestingOptionals;

    init() {
        self.dat = BigNestingOptionals{
            s1: S1{
                s2: S2{
                    s3: S3{
                        s4: S4{
                            endingValue: null
                        }
                    }
                }
            }
        };
    }
}
