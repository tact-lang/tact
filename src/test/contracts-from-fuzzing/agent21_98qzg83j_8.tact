contract TestDumpAll2 {
    receive() {
        // Dumping a cell
        dump(emptyCell());
        
        // Dumping a builder
        dump(beginCell());
        
        // Dumping a slice
        dump(emptySlice());
        
        // Dumping a string
        dump("Hello, debugging");
        
        // Dumping a map
        let m: map<Int, Int> = emptyMap();
        m.set(4, 4);
        dump(m);
        
        // Dumping an optional null
        dump(null);
        
        // Dumping a void value from emit
        dump(emit("msg".asComment()));
    }
}
