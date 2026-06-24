// Contract with many booleans and strings in different order
contract TestContract {
    flag1: Bool;
    str1: String;
    flag2: Bool;
    str2: String;
    flag3: Bool;
    flag4: Bool;
    str3: String;
    flag5: Bool;

    init() {
        self.flag1 = true;
        self.str1 = "1";
        self.flag2 = false;
        self.str2 = "2";
        self.flag3 = true;
        self.flag4 = false;
        self.str3 = "3";
        self.flag5 = true;
    }
}