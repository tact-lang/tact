contract SimpleGetter {
    x: Int;

    init() {
        self.x = 42;
    }

    get fun getX(): Int {
        return self.x;
    }
}
