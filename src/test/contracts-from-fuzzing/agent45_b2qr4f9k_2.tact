contract EmptyFields {
    value1: Int;
    value2: Int;
    bool1: Bool;
    bool2: Bool;
    str: String;
    
    init() {
        self.value1 = 0;
        self.value2 = 1;
        self.bool1 = true;
        self.bool2 = false;
        self.str = "abc";
    }
}