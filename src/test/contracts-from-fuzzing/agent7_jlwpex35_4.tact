contract TC1 {
    fun early_return(x: Int): Int {
        if (x == 0) {
            return 0;
        }
        return x;
    }
}
