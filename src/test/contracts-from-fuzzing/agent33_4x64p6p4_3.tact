contract TestDump {
    receive() {
        // Dump a primitive integer
        dump(123);
        
        // Dump a primitive boolean
        dump(true);
        
        // Dump a null value (for optionals)
        dump(null);
        
        // Dump a Cell using emptyCell()
        dump(emptyCell());
        
        // Dump a Builder using beginCell()
        dump(beginCell());
        
        // Dump a Slice using emptySlice()
        dump(emptySlice());
        
        // Dump a String
        dump("Hello, Tact");
    }
}
