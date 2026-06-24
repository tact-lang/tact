contract Test {
    receive() {
        // dump() with primitive types
        dump(123);
        dump(true);
        
        // dump() with Cell, Builder, and Slice
        dump(emptyCell());
        dump(beginCell());
        dump(emptySlice());
        
        // dump() with String and null value
        dump("Test string");
        dump(null);
        
        // dump() with an optional value (with value present)
        let opt: Int? = 99;
        dump(opt);
        
        // dump() with a call that returns void: emit() returns void
        dump(emit("Test msg".asComment()));
        
        // dumpStack() test
        dumpStack();
    }
}
