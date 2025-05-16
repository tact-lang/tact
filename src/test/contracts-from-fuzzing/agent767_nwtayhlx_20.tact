struct ManyStrOpt {
    s1:String?; s2:String?; s3:String?; s4:String?; s5:String?;
    s6:String?; s7:String?; s8:String?; s9:String?; s10:String?;
}

contract OptionalStrings {
    data: ManyStrOpt;

    init() {
        self.data = ManyStrOpt{
            s1: "one", s2: null, s3: "three", s4: null, s5: "five",
            s6: null, s7: "seven", s8: null, s9: "nine", s10: null
        };
    }
}
