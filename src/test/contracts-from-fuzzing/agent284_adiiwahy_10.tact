struct LongStrings {
    str1: String;
    str2: String;
}

contract StringsInState {
    texts: LongStrings;
    
    init() {
        self.texts = LongStrings{
            str1: "This is a fairly long string to test storage and serialization.",
            str2: "Another long string to fuzz persistent contract storage with."
        };
    }
}