struct StrEmbedded {
    s1: String;
    s2: String?;
}

contract TestStringStruct {
    state: StrEmbedded;
    init() {
        self.state = StrEmbedded{
            s1: "abc",
            s2: null
        };
    }
}