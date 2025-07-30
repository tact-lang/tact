struct JustStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract JustStringsContract {
    data: JustStrings;
    init() {
        self.data = JustStrings{ s1:"a", s2:"b", s3:"c", s4:"d" };
    }
}