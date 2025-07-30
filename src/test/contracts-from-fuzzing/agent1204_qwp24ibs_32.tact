// Contract with many nested structs and optional chains
struct S3 {
    flag: Bool?;
}

struct S2 {
    s3: S3?;
    value: Int;
}

struct S1 {
    s2: S2?;
    text: String;
}

contract ManyOptionalLevels {
    root: S1;

    init() {
        self.root = S1{
            s2: null,
            text: "Hi"
        };
    }
}