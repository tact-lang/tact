// Struct with 20 String fields
struct ManyStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    s6: String;
    s7: String;
    s8: String;
    s9: String;
    s10: String;
    s11: String;
    s12: String;
    s13: String;
    s14: String;
    s15: String;
    s16: String;
    s17: String;
    s18: String;
    s19: String;
    s20: String;
}

contract LotsOfStrings {
    st: ManyStrings;
    init() {
        self.st = ManyStrings{
            s1:"1", s2:"2", s3:"3", s4:"4", s5:"5",
            s6:"6", s7:"7", s8:"8", s9:"9", s10:"10",
            s11:"11", s12:"12", s13:"13", s14:"14", s15:"15",
            s16:"16", s17:"17", s18:"18", s19:"19", s20:"20"
        };
    }
}