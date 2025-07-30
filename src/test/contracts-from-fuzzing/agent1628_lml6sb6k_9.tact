struct BigStrings {
    text1: String;
    text2: String;
    text3: String;
    text4: String;
}

contract LongStringFieldsContract {
    big: BigStrings;

    init() {
        self.big = BigStrings{
            text1: "Lorem ipsum dolor sit amet",
            text2: "consectetur adipiscing elit",
            text3: "sed do eiusmod tempor incididunt",
            text4: "ut labore et dolore magna aliqua"
        };
    }
}