struct S1 {
    i: Int;
}

struct S2 {
    f: Bool;
    s: S1;
}

struct S3 {
    label: String;
    sub: S2?;
}

contract TestDeepOptional {
    nested: S3;

    init() {
        self.nested = S3{
            label: "hi",
            sub: S2{
                f: true,
                s: S1{ i: 777 }
            }
        };
    }
}