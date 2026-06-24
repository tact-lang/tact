contract TestContract {
    int1: Int = 1;
    int2: Int = 2;
    bool1: Bool = true;
    bool2: Bool = false;
    str1: String = "abc";
    str2: String = "xyz";
    opt1: Int? = null;
    opt2: String? = "maybe";
    
    init() {
        self.opt1 = 100;
        self.opt2 = null;
    }
}