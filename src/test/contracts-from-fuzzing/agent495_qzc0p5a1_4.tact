struct VeryNested {
    s1: S1;
}

struct S1 {
    s2: S2;
}

struct S2 {
    s3: S3;
}

struct S3 {
    s4: S4;
}

struct S4 {
    val: Int?;
    flag: Bool;
}

contract TestDeepNest {
    persistent: VeryNested;

    init() {
        self.persistent = VeryNested{
            s1: S1{
                s2: S2{
                    s3: S3{
                        s4: S4{ val: null, flag: true }
                    }
                }
            }
        };
    }
}