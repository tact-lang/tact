contract TestReturnCorrect {
    fun funcTest(): Int {
        return 42;
    }
    receive() {
        dump(self.funcTest());
    }
}
