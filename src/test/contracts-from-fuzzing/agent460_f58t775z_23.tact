struct LongStringStruct {
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
}

contract LongStringsTest {
    data: LongStringStruct = LongStringStruct{
        s1: "a", s2: "b", s3: "c", s4: "d", s5: "e",
        s6: "f", s7: "g", s8: "h", s9: "i", s10: "j"
    };
    init() {
        self.data = LongStringStruct{
            s1: "a1", s2: "b2", s3: "c3", s4: "d4", s5: "e5",
            s6: "f6", s7: "g7", s8: "h8", s9: "i9", s10: "j10"
        };
    }
}
