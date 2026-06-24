struct HasString {
    s1: String;
    s2: String;
}

contract ManyStrings {
    data: HasString;

    init() {
        self.data = HasString{
            s1: "first",
            s2: "second",
        };
    }
}