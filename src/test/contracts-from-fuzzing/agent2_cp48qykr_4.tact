contract TestGetterParams {
    receive() {}

    get fun addOne(a: Int): Int {
        return a + 1;
    }
}
