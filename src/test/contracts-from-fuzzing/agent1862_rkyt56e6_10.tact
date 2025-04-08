struct S1 {
    a: Int;
    b: Int;
}

struct S2 {
    s1: S1;
    flag: Bool;
}

struct S3 {
    s2: S2;
    text: String;
}

contract DeepStructs {
    val: S3;
    init() {
        self.val = S3{
            s2: S2{
                s1: S1{ a: 1, b: 2 },
                flag: true
            },
            text: "ok"
        };
    }
}