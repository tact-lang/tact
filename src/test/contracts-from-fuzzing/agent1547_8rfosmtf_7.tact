struct S1 {
    text: String;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

struct S3 {
    opt_s2: S2?;
}

contract NestedOptionalStructContract {
    bigField: S3;

    init() {
        self.bigField = S3 {
            opt_s2: null
        };
    }
}