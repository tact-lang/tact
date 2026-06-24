struct Strings {
    s1: String;
    s2: String?;
}

contract StringFields {
    vals: Strings;
    init() {
        self.vals = Strings{
            s1:"hi",
            s2:null
        };
    }
}