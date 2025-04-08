struct ContainsStr {
    s0: String;
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract StrFields {
    data: ContainsStr;

    init() {
        self.data = ContainsStr{
            s0: "a",
            s1: "bb",
            s2: "ccc",
            s3: "dddd",
            s4: "eeeee",
        };
    }
}
