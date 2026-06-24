contract GetterModify {
    v: Int = 10;

    receive() {}

    // Getter that modifies the state variable and returns it
    get fun inc_getter(): Int {
        self.v += 1;
        return self.v;
    }
}
