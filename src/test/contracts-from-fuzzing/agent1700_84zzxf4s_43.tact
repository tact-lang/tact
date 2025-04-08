struct S1 {
    i: Int?;
    s: String?;
}

struct S2 {
    a: S1?;
    flag: Bool;
}

struct S3 {
    nested: S2?;
    str: String;
}

contract DeepNestedOptionals {
    data: S3;

    init() {
        self.data = S3{
            nested: S2{
                a: S1{i: 10, s: "txt"},
                flag: true
            },
            str: "hello"
        };
    }
}
