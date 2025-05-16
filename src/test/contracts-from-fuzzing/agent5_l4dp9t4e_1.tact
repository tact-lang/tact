contract TestGetter {
    x: Int;

    init() {
        self.x = 42;
    }

    // Getter that attempts to modify a state variable
    get fun test(): Int {
        self.x = 100; // attempt modification in getter
        return self.x;
    }
}
