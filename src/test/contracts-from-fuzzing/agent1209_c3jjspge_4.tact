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
}

contract StringsTest {
    data: ManyStrings;

    init() {
        self.data = ManyStrings{
            s1: "",
            s2: "",
            s3: "",
            s4: "",
            s5: "",
            s6: "",
            s7: "",
            s8: "",
            s9: "",
            s10: "",
        };
    }
}
