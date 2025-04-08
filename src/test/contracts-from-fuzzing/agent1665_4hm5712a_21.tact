struct HasStrings {
    s1: String;
    s2: String?;
}

contract Test21 {
    data: HasStrings;

    init() {
        self.data = HasStrings{
            s1: "abc",
            s2: null
        };
    }
}