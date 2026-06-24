contract TestGetter {
    x: Int;

    init() {
        self.x = 10;
    }

    // Getter function that modifies a state variable
    get fun get_and_modify() : Int {
        self.x = self.x + 5;
        return self.x;
    }
}
