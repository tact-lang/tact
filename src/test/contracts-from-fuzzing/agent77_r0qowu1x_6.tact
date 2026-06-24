contract Test {
    const MULTIPLIED: Int = 2 * 21;

    fun get() : Int {
        return self.MULTIPLIED;
    }

    receive() {
        self.get();
    }
}
