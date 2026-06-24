struct StructWithStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract Test {
    data: StructWithStrings;

    init() {
        self.data = StructWithStrings{
            s1: "Hello",
            s2: "Tact",
            s3: "Blockchain",
        };
    }
}