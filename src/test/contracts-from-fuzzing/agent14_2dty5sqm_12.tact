contract TestMapAsCell {
    m: map<Int, Int> = emptyMap();
    
    init() {
        self.m.set(10, 100);
    }
    
    // Getter to return the underlying Cell representation of the map
    get fun cell(): Cell? {
        return self.m.asCell();
    }
}
