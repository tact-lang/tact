contract TestGetter1 {
    x: Int;

    init() {
        self.x = 0;
    }

    // A getter function that attempts to modify the state variable
    get fun getAndModify(): Int {
        self.x = 42;
        return self.x;
    }
}
