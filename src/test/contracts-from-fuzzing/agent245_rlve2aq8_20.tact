contract ChainAssignTest {
    counter: Int;
    flag: Bool;
    
    init() {
        self.counter = 0;
        self.counter += 5;
        self.flag = false;
        self.flag = true;
    }
}