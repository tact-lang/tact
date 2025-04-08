struct S1 {
    flag: Bool;
}

struct S2 {
    nested: S1;
    text: String;
}

struct S3 {
    more: S2;
}

contract DeepNestFields {
    data: S3;

    init() {
        self.data = S3{
            more: S2{
                nested: S1{ flag: false },
                text: "hi"
            }
        };
    }
}