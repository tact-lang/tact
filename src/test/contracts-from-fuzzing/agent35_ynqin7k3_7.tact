struct LongStrings {
    str1: String;
    str2: String;
    str3: String;
    str4: String;
}

contract StringStorage {
    data: LongStrings;

    init() {
        self.data = LongStrings{
            str1: "Lorem ipsum",
            str2: "dolor sit amet",
            str3: "consectetur adipiscing elit",
            str4: "sed do eiusmod",
        };
    }
}