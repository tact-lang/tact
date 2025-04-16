contract Test {
    // Function returning an optional Int
    fun optionalReturn(x: Int): Int? {
        if (x == 0) {
            return null;
        }
        return x;
    }
    
    receive() {}
}
