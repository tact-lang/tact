struct S {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract TestStrings {
    fld: S;

    init() {
        self.fld = S{
            s1: "a",
            s2: null,
            s3: "b",
            s4: null,
        };
    }
}