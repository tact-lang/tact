contract TestContract {
    text1: String = "abc";
    text2: String = "def";
    num: Int = 42;

    init() {
        self.text1 = "xyz";
        self.num = 77;
    }
    
    receive() {
        dump(self.text1);
        dump(self.text2);
        dump(self.num);
    }
}
