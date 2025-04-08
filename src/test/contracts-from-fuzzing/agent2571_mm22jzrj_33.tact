struct CrazyDeep {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
    s5: String;
    s6: String?;
    s7: String;
    s8: String?;
    s9: String;
    s10: String?;
}

contract LotsOfStrings {
    data: CrazyDeep;

    init() {
        self.data = CrazyDeep{
            s1:"a", s2:null, s3:"b", s4:null, s5:"c",
            s6:null, s7:"d", s8:null, s9:"e", s10:null
        };
    }
}
