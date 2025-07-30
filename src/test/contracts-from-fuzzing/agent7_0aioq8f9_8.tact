contract Test {
    v: Int;

    init() {
        self.v = 0;
    }

    // Getter function that attempts to modify state (but modifications won't persist)
    get fun test(): Int {
        self.v += 1;
        return self.v;
    }

    receive() {
        dump(self.test());
    }
}
