struct LongStr {
    s1: String = "1";
    s2: String = "2";
    s3: String = "3";
    s4: String = "4";
    s5: String = "5";
    s6: String = "6";
    s7: String = "7";
    s8: String = "8";
    s9: String = "9";
    s10: String = "10";
    s11: String = "11";
    s12: String = "12";
    s13: String = "13";
    s14: String = "14";
    s15: String = "15";
    s16: String = "16";
    s17: String = "17";
    s18: String = "18";
    s19: String = "19";
    s20: String = "20";
}

contract TestContract {
    data: LongStr;
    init() {
        self.data = LongStr{};
    }
    receive() {}
}