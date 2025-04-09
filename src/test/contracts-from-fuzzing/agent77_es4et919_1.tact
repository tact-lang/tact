contract BasicGetter {
    x: Int;

    init() {
        self.x = 100;
    }

    receive() {}

    get fun getX(): Int {
        return self.x;
    }
}
