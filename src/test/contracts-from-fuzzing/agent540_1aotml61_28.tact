struct S1 {
    val: Int;
}

struct S2 {
    s1: S1;
    flag: Bool;
}

struct S3 {
    s2: S2;
    message: String;
}

contract DeeplyNested {
    current: S3;

    init() {
        self.current = S3{
            s2: S2{
                s1: S1{ val: 42 },
                flag: true
            },
            message: "hi"
        };
    }
}