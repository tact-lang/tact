// Contract with many Strings and Bools
contract TestContract {
    str1: String = "a";
    str2: String = "b";
    str3: String = "c";
    str4: String = "d";
    str5: String = "e";

    flag1: Bool = true;
    flag2: Bool = false;
    flag3: Bool = true;
    flag4: Bool = false;
    flag5: Bool = true;

    init() {
        self.str4 = "D";
        self.flag5 = false;
    }

    receive() {
        let _ = self.str2;
    }
}