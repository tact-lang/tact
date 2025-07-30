struct S1 {
    a: Int;
}

struct S2 {
    b: Bool;
    s1: S1;
}

struct S3 {
    text: String;
    s2: S2;
}

contract NestedDifferentTypes {
    root: S3;

    init() {
        self.root = S3{
            text: "hi",
            s2: S2{
                b: true,
                s1: S1{
                    a: 123
                }
            }
        };
    }
}