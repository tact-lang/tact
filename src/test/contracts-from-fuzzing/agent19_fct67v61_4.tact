contract TestGetterModification {
    x: Int;

    init() {
        self.x = 100;
    }

    // Getter function that modifies state variable
    get fun getter(): Int {
        self.x = self.x + 1;
        return self.x;
    }
}
