contract GetterModify {
    value: Int;

    init() {
        self.value = 0;
    }

    // Getter function that attempts to modify state variable
    get fun change(): Int {
        self.value = self.value + 1;
        return self.value;
    }
}
