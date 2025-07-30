contract Test {
    receive() {
        // Test dump() with primitive Int
        dump(123);
        
        // Test dump() with primitive Bool
        dump(true);
        
        // Test dump() with Cell, Builder, and Slice
        dump(emptyCell());
        dump(beginCell());
        dump(emptySlice());

        // Test dump() with String and null value
        dump("Test string");
        dump(null);
        
        // Test dump() with an optional value (value present)
        let opt: Int? = 99;
        dump(opt);
        
        // Test dumpStack
        dumpStack();
    }
}
