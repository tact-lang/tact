contract Test {
    const MY_CONSTANT: Int = 42;

    fun get() : Int {
        return self.MY_CONSTANT;
    }

    receive() {
        self.get();
    }
}
