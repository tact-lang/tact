contract TestGetter {
    x: Int;

    init() {
        self.x = 0;
    }

    // Getter function that attempts to modify the state variable x
    get fun update(): Int {
        self.x = 42;
        return self.x;
    }
}
