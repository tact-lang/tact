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

contract StringFields {
    val: LongStringStruct;

    init() {
        self.val = LongStringStruct{
            s1: "1",
            s2: "2",
            s3: "3",
            s4: "4",
            s5: "5",
            s6: "6",
            s7: "7",
            s8: "8",
            s9: "9",
            s10: "10"
        };
    }
}