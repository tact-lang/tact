// Mix nested/flat/optionals and defaults
struct S1 {
    a: Int?;
    s2: S2;
}

struct S2 {
    b: Bool = true;
    s3: S3?;
}

struct S3 {
    c: String;
    d: Int = 123;
}

contract TestContract {
    data: S1;
    
    init() {
        self.data = S1{
            a: null,
            s2: S2{
                s3: S3{
                    c: "ccc",
                },
            },
        };
    }
}