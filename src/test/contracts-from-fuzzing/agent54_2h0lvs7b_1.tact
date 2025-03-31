contract ReturnTest1 {
    receive () {}
    fun example(x: Int): Int {
        if(x > 10) {
            return x;
        }
        return (-x);
    }
}
