contract Test {
    receive() {
        // Primitive types
        dump(123);
        dump(true);
        
        // Special value: null
        dump(null);
        
        // Cells, Builders, and Slices
        dump(emptyCell());  // Cell
        dump(beginCell());  // Builder
        dump(emptySlice()); // Slice
        
        // String
        dump("Hello, Debug!");
        
        // Invalid for dump: functions that return void
        dump(emit("msg".asComment()));
    }
}
