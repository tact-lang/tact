struct S1 {
    value: Int;
    name: String;
}

struct S2 {
    flag: Bool;
    s1: S1;
}

struct S3 {
    opt: Int?;
    inner: S2;
    text: String;
}

contract Test {
    state: S3;

    init() {
        self.state = S3{
            opt: null,
            inner: S2{
                flag: true,
                s1: S1{
                    value: 100,
                    name: "nested"
                }
            },
            text: "level3"
        };
    }
}
