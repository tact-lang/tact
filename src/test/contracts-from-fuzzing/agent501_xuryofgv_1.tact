contract TestContract {
    flag: Bool;

    init() {
        self.flag = true;
    }
    
    receive() {
        self.flag = false;
    }
}