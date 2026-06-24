contract TestContract {
    singleInt: Int;

    init() {
        self.singleInt = 42;
    }
    
    receive() {
        self.singleInt = self.singleInt + 1;
    }
}