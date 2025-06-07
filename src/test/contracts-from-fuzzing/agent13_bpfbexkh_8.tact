contract Test {
    value: Int = 10;
    
    // Getter function that modifies a state variable (allowed but modifications are not persisted)
    get fun getAndModify(): Int {
        self.value += 5;
        return self.value;
    }
    
    receive() {}
}
