contract TestGetterMutation {
    x: Int = 10;

    receive() {}

    // Getter function that modifies state internally (but modification won't persist)
    get fun mutateGetter(): Int {
        self.x += 1;
        return self.x;
    }
}
