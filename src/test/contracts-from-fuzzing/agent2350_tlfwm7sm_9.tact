struct StrLong {
    f0: String;
    f1: String;
    f2: String;
    f3: String;
    f4: String;
    f5: String;
    f6: String;
    f7: String;
    f8: String;
    f9: String;
    f10: String;
    f11: String;
    f12: String;
    f13: String;
    f14: String;
    f15: String;
    f16: String;
    f17: String;
    f18: String;
    f19: String;
}

contract Stringy {
    s: StrLong;

    init() {
        self.s = StrLong{
            f0: "string0",
            f1: "string1",
            f2: "string2",
            f3: "string3",
            f4: "string4",
            f5: "string5",
            f6: "string6",
            f7: "string7",
            f8: "string8",
            f9: "string9",
            f10: "string10",
            f11: "string11",
            f12: "string12",
            f13: "string13",
            f14: "string14",
            f15: "string15",
            f16: "string16",
            f17: "string17",
            f18: "string18",
            f19: "string19"
        };
    }
}