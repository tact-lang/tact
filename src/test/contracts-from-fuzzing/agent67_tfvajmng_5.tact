contract TestMapReplaceGet() {
    fun run() {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);
        // Replace existing key: should return the old value (70) as a non-null value
        let oldVal1: Int? = m.replaceGet(7, 68); // key 7 now maps to 68
        dump(oldVal1!!); // expecting 70
        
        // Replace non-existing key: should return null
        let oldVal2: Int? = m.replaceGet(8, 68);
        if (oldVal2 == null) {
            dump(0); // dump 0 if null
        } else {
            dump(oldVal2!!);
        }
    }
    
    receive() {
        self.run();
        return;
    }
}
