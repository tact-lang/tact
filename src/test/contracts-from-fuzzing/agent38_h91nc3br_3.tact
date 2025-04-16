contract Test {
    state: Int = 0;

    receive("hello") {
        self.state = 2;
    }

    fun getState(): Int {
        return self.state;
    }
}
