contract Test {
    counter: Int;
    
    init() {
        self.counter = 0;
    }

    // getter function that tries to modify state
    get fun test(): Int {
        self.counter = self.counter + 1;
        return self.counter;
    }
}
