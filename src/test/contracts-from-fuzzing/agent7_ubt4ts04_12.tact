contract Playground {
    fun noReturn() {
        // This function deliberately returns void
    }

    fun dumpOptionals() {
        let opt: Int? = null;
        dump(opt);
        opt = 42;
        dump(opt);
    }

    fun dumpMap() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        dump(m);
    }

    receive("plays") {
        // Primitive types
        dump(42);
        dump(true);
        dump(null);

        // Cell, Builder, and Slice types
        dump(emptyCell());
        dump(beginCell());
        dump(emptySlice());

        // String type
        dump("Dumping a string");
        
        // Optionals
        self.dumpOptionals();
        
        // Map example
        self.dumpMap();
        
        // Dumping a void value from a function
        dump(self.noReturn());
        
        // Dumping the result of an emit() call, which returns void
        dump(emit("Hello, as comment".asComment()));
        
        // Dump stack
        dumpStack();
    }
}
