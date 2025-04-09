struct S {
    s: String;
}

contract ManyNestedStrings {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{s: "a"};
        self.s2 = S{s: "b"};
        self.s3 = S{s: "c"};
    }
}