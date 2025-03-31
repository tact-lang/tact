contract Test {
    state: Int = 42;
    
    receive() {
        // Call the getter to ensure it's compiled
        self.test1();
    }
    
    get fun test1(): Int {
        return self.state;
    }
}
