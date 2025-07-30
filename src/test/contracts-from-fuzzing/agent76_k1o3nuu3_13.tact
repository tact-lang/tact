contract TestGetterArg {
    receive () {}

    get fun getWithArgs(a: Int): Int {
        return a + 1;
    }
}
