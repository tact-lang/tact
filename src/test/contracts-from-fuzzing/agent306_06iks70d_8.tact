struct MultiString {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract StringsStorage {
    data: MultiString;

    init() {
        self.data = MultiString{
            s1: "a",
            s2: "b",
            s3: "c",
            s4: "d"
        };
    }
}
