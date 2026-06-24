contract TestGetterModification {
    x: Int;

    init() {
        self.x = 42;
    }

    // getter function that modifies the state variable (modification won't persist)
    get fun getX(): Int {
        self.x = self.x + 1;
        return self.x;
    }
}
