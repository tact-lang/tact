contract TestDebugValues {
    receive() {
        // Dump a Cell
        dump(emptyCell());
        // Dump a Builder
        dump(beginCell());
        // Dump a Slice
        dump(emptySlice());
        
        // Dump a string literal
        dump("Hello, Tact!");
        
        // Dump an optional null
        let a: Int? = null;
        dump(a);
    }
}
