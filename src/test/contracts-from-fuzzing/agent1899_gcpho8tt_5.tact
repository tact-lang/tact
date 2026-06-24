struct LongStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract LongStringsContract {
    data: LongStrings;

    init() {
        self.data = LongStrings{
            s1: "A very very very very long string A",
            s2: "B very very very very long string B",
            s3: "C very very very very long string C",
            s4: "D very very very very long string D"
        };
    }
}