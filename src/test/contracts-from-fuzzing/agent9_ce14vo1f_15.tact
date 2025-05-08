contract MapNullComparison {
    // No persistent default value for maps; empty maps are considered as 'null' when casting to Cell.
    m: map<Int, Int>;

    init() {
        // Initialize the map to empty
        self.m = emptyMap();
        
        // In Tact, comparing an empty map to null should behave the same as .isEmpty()
        // We expect this condition to be true.
        if (self.m == null) {
            dump(1);
        } else {
            dump(0);
        }
    }

    get fun test(): Bool {
        // Returns true if the map is considered empty (or null equivalently)
        return self.m == null;
    }
}
