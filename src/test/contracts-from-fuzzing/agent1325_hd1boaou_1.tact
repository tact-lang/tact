contract TestContract {
    intField: Int;

    init() {
        self.intField = 1;
    }
    
    receive() {
        self.intField += 1;
    }
}