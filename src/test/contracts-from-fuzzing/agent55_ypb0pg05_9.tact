contract TestGetModification {
    v: Int = 10;

    receive() {}

    // Getter that modifies the state variable (but changes won't persist)
    get fun increment(): Int {
        self.v += 1;
        return self.v;
    }
}
