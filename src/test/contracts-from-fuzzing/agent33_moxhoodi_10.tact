contract TestAsCell {
    receive() {
        // Initialize a map of Int to Int
        let m: map<Int, Int> = emptyMap();
        
        // Insert a couple of key-value pairs
        m.set(1, 40);
        m.set(2, 30);
        
        // Convert the map to a Cell using asCell()
        let cellOpt: Cell? = m.asCell();
        
        // If the returned Cell is not null, dump 1; otherwise, dump 0
        if (cellOpt != null) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
