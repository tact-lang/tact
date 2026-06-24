contract GetterModify {
    x: Int;

    init() {
        self.x = 10;
    }

    // getter function that modifies the state variable x, though the change won't persist
    get fun getX(): Int {
        self.x = self.x + 5;
        return self.x;
    }
}
