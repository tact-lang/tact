contract SingleBool {
    myFlag: Bool;

    init() {
        self.myFlag = true;
    }
    
    receive() {
        self.myFlag = false;
    }
}