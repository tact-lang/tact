contract Test7 {
    v: Int = 0;

    receive() {}

    // Getter that modifies a state variable
    get fun test(): Int {
        self.v += 1;
        return self.v;
    }
}
