struct LongStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract ContractWithLongs {
    data: LongStrings;

    init() {
        self.data = LongStrings{
            s1: "11111",
            s2: "22222",
            s3: "33333",
            s4: "44444",
            s5: "55555",
        };
    }
}