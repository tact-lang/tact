// Snippet 9: Iteration over map entries

contract IterationTest {
    state: map<Int, Bool>;
    init() {
        self.state = emptyMap();
        self.state.set(1, true);
        self.state.set(2, false);
        
        // Iterate over map entries. Note: foreach is only allowed over state variables that are direct path expressions.
        foreach (key, value in self.state) {
            // For testing purpose, simply use the key and value
            let _ = key;
            let _ = value;
        }
    }
    
    get fun read(): Int {
        // Dummy getter just to satisfy contract structure
        return 0;
    }
}
