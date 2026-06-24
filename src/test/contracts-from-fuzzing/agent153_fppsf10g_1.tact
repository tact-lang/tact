contract SingleInt {
    num: Int;

    init() {
        self.num = 42;
    }
    
    receive() {
        self.num = self.num + 1;
    }
}