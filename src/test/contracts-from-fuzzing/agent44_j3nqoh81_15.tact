contract Test {
    // Test function using mutable local variable and return within loop
    fun mutableReturn(x: Int): Int {
        let ret: Int = 0;
        repeat (5) {
            ret = ret + 1;
            if (ret > 3) {
                return ret;
            }
        }
        return ret;
    }
    
    // Getter with loop-based conditional return
    get fun loopGetter(x: Int): Int {
        repeat (1) {
            if (x == 0) {
                return 100;
            }
        }
        return 50;
    }
    
    receive() {}
}
