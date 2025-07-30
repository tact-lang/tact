contract TestMapIteration2 {
    // Testing iteration with side-effects via replace() on map entries
    fizz: map<Int, Int> = emptyMap();

    init() {
        // Populate the map
        self.fizz.set(1, 10);
        self.fizz.set(2, 20);
        self.fizz.set(3, 30);
        
        // Iterate over the map (allowed since self.fizz is a path expression) and update each entry
        foreach (k, v in self.fizz) {
            // Double each value
            self.fizz.replace(k, v * 2);
        }
        
        // Verify that values have been doubled
        if (self.fizz.get(1)!! != 20 || self.fizz.get(2)!! != 40 || self.fizz.get(3)!! != 60) {
            throw(101);
        }
    }
}
