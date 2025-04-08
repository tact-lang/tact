struct OptionalStrings {
    s1: String?;
    s2: String?;
}

contract OptionalStringsContract {
    s: OptionalStrings;
    init() {
        self.s = OptionalStrings{s1:null,s2:null};
    }
    receive() {
        self.s = OptionalStrings{s1:"hi",s2:"bye"};
    }
}