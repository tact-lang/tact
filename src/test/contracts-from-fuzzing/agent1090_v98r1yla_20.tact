struct NestStr {
    s1: String;
    s2: String;
}

struct OuterStr {
    inner: NestStr;
    s3: String;
}

contract NestedStrings {
    s: OuterStr;

    init() {
        self.s = OuterStr{
            inner: NestStr{ s1: "a", s2: "b" },
            s3: "c"
        };
    }
}