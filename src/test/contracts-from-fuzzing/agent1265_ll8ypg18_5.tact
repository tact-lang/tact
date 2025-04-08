struct BigNested {
    s1: String;
    s2: String;
    opt1: Int?;
    opt2: Bool?;
    s3: String;
    s4: String;
    s5: String;
    s6: String;
    s7: String;
    s8: String;
}

contract BigData {
    data: BigNested;
    init() {
        self.data = BigNested{
            s1: "1",
            s2: "2",
            opt1: null,
            opt2: true,
            s3: "3",
            s4: "4",
            s5: "5",
            s6: "6",
            s7: "7",
            s8: "8",
        };
    }
}