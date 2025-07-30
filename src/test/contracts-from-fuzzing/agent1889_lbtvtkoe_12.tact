struct WithString {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract StringFields {
    store: WithString;

    init() {
        self.store = WithString{
            s1: "a",
            s2: null,
            s3: "",
            s4: "b"
        };
    }
}
