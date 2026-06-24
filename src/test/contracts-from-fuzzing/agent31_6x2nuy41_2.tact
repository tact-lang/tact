contract Test1 {
    fun early_return(x: Int): Int {
        if (x < 0) {
            return -1;
        } else {
            return x;
        }
    }
}
