struct S1 {
    val: Int;
}

struct S2 {
    s1: S1;
    flag: Bool;
}

struct S3 {
    s2: S2;
    text: String;
}

contract ChainTest {
    storage: S3;

    init() {
        self.storage = S3{
            s2: S2{
                s1: S1{ val: 123 },
                flag: true
            },
            text: "hello"
        };
    }
}