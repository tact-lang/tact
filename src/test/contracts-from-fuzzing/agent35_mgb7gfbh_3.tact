contract TestGetterMod {
    x: Int;

    init() {
        self.x = 0;
    }

    get fun modifyGetter(): Int {
        // Attempt to modify state variable within a getter
        self.x = self.x + 1;
        return self.x;
    }
}
