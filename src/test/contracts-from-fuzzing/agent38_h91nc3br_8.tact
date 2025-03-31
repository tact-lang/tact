contract TestOverlap {
    state: Int = 0;

    receive("hello") {
        self.state = 10;
    }

    receive(str: String) {
        self.state = 20;
    }

    fun getState(): Int {
        return self.state;
    }
}
