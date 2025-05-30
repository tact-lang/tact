contract TestContract {
    str1: String = "aaa";
    str2: String = "bbb";
    str3: String = "ccc";
    str4: String = "ddd";

    init() {
        self.str1 = "111";
        self.str2 = "222";
        self.str3 = "333";
        self.str4 = "444";
    }

    receive() {
        dump(self.str1);
    }
}