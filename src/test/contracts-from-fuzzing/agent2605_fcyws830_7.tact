struct OptString {
    s1: String?;
    s2: String;
    s3: String?;
    s4: String;
}

contract OptionalStrings {
    payload: OptString;

    init() {
        self.payload = OptString{
            s1: null,
            s2: "abc",
            s3: null,
            s4: "def",
        };
    }
}
