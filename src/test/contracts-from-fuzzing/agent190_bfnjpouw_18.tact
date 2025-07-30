struct S3 {
    u: Int?;
    v: Bool?;
}

struct S2 {
    t: S3?;
    s: String?;
}

struct S1 {
    r: S2?;
}

contract TestContract {
    val: S1;

    init() {
        self.val = S1{
            r: S2{
                t: S3{
                    u: null,
                    v: null,
                },
                s: null,
            }
        };
    }
}