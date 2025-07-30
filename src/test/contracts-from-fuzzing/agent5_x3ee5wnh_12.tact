contract Test {
    x: Int;
    
    init() {
         self.x = 10;
    }
    
    // Getter that modifies state variable (runtime modification not persisted)
    get fun inc() : Int {
         self.x = self.x + 1;
         return self.x;
    }
}

// This snippet only defines the contract; no main function is needed to test compilation
