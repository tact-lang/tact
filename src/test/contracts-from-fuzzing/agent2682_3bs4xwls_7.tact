struct ManyStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract TestContract {
    textData: ManyStrings;

    init() {
        self.textData = ManyStrings{
            s1:"a", s2:"bb", s3:"ccc", s4:"dddd", s5:"eeeee"
        };
    }
}
