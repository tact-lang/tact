struct LargeStrings {
    s0: String;
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract LargeStringsContract {
    data: LargeStrings;

    init() {
        self.data = LargeStrings {
            s0: "a",
            s1: "bb",
            s2: "ccc",
            s3: "dddd",
            s4: "eeeee",
        };
    }
}