struct S1 {
    i: Int;
}

struct S2 {
    s1: S1;
    flag: Bool;
}

struct S3 {
    s2: S2;
    val: Int;
    opt: String?;
}

contract DeepNested {
    field: S3;

    init() {
        self.field = S3{
            s2: S2{
                s1: S1{ i: 123 },
                flag: true,
            },
            val: 456,
            opt: "test",
        };
    }
}