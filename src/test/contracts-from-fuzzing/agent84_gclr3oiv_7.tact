contract Test8 {
    fun f(limit: Int): Int {
        let r: Int = 0;
        repeat (limit) {
            if (r == 2) { return r; }
            r = r + 1;
        }
        return -1;
    }
    
    receive() {}
}
