struct MultipleStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract StructManyStrings {
    s: MultipleStrings;
    init() {
        self.s = MultipleStrings{
            s1: "1", s2: "2", s3: "3", s4: "4", s5: "5"
        };
    }
    receive() {}
}