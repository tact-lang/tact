contract TestPriority {
    state: Int = 0;

    receive() {
        self.state = 1;
    }

    receive("hello") {
        self.state = 10;
    }

    receive(str: String) {
        self.state = 20;
    }

    receive(msg: Slice) {
        self.state = 30;
    }

    fun getState(): Int {
        return self.state;
    }
}
