contract SingleIntField {
    // Minimal persistent state variable of primitive type Int
    counter: Int;

    init() {
        self.counter = 0;
    }
}