contract Test {
    fun foo(x: Int): Int {
        if (x > 10) {
            return 100;
        }
        return 200;
    }
    
    receive () {}
}
