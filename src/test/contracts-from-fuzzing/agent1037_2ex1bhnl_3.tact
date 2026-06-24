struct OptionalNest {
    s1: S1?;
}

struct S1 {
    s2: S2?;
}

struct S2 {
    intVal: Int?;
    boolVal: Bool?;
    s3: S3?;
}

struct S3 {
    strVal: String;
}

contract TestContract {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            s1: S1{
                s2: S2{
                    intVal: 1,
                    boolVal: true,
                    s3: S3{
                        strVal: "test"
                    }
                }
            }
        };
    }
}