struct S1 {
    x: Int?;
}

struct S2 {
    x: S1?;
}

struct S3 {
    x: S2?;
}

struct S4 {
    x: S3?;
}

contract MultiOptionNest {
    data: S4?;

    init() {
        self.data = S4{
            x: S3{
                x: S2{
                    x: S1{
                        x: null
                    }
                }
            }
        };
    }
}
