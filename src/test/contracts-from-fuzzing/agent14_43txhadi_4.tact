contract TestReturnFixed {
    fun getVal(): Int {
        // Testing explicit return with semicolon omitted in last statement
        return 100
    }
    receive() {
        dump(self.getVal());
    }
}
