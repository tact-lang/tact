struct ManyOptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
    s6: String?;
    s7: String?;
    s8: String?;
}

contract OptStrings {
    ss: ManyOptionalStrings;
    init() {
        self.ss = ManyOptionalStrings{
            s1:null, s2:null, s3:null, s4:null, s5:null, s6:null, s7:null, s8:null
        };
    }
}