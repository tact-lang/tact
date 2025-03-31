contract TestUnderscore {
    state: Int = 0;

    receive(_: String) {
        self.state = 10;
    }

    fun getState(): Int {
        return self.state;
    }
}
