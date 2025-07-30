contract TestMapBasics {
    // Basic map definition using correct generic syntax
    fizz: map<Int,Int> = emptyMap();

    init() {
        // Inserting values into map
        self.fizz.set(1, 10);
        self.fizz.set(2, 20);
        // Testing exists
        let exists1: Bool = self.fizz.exists(1);
        if (!exists1) {
            throw(1001);
        }
        // Testing get
        let val: Int? = self.fizz.get(2);
        if (val == null || val != 20) {
            throw(1002);
        }
        // Testing deletion via replace with null
        let replaced: Bool = self.fizz.replace(1, null);
        if (!replaced || self.fizz.exists(1)) {
            throw(1003);
        }
        // Testing isEmpty (should be false because one element remains)
        if (self.fizz.isEmpty()) {
            throw(1004);
        }
    }
}
