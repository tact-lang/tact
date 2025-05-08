struct OptString {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptionalStrings {
    f: OptString;

    init() {
        self.f = OptString{
            s1: "one",
            s2: null,
            s3: "three"
        };
    }
}
