struct Pair { first: Int; second: Int }

contract TestGetter {
    v: Int = 10;
    
    receive() {}
    
    // Getter that modifies state variable (modification should not persist)
    get fun getAndModify(): Int {
        self.v = self.v + 1;
        return self.v;
    }
    
    // Test function: calls the getter and then reads v, expecting the getter's change not to persist
    fun testGet(): Pair {
        let a = self.getAndModify(); // Expected: returns 11
        let b = self.v;              // Expected: remains 10
        return Pair{ first: a, second: b };
    }
}
