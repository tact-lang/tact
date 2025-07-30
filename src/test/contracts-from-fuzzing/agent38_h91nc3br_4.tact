contract Test {
    state: Int = 0;

    receive(str: String) {
        if (str == "special") {
            self.state = 100;
        } else {
            self.state = 50;
        }
    }

    fun getState(): Int {
        return self.state;
    }
}
