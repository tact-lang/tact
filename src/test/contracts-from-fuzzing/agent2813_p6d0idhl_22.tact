struct MultipleStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract TestMultipleStrings {
    x: MultipleStrings;
    init() {
        self.x = MultipleStrings{
            s1:"a",
            s2:"b",
            s3:"c",
            s4:"d"
        };
    }
}
