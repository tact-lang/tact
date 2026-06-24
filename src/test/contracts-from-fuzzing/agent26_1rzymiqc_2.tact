contract TestGetter2 {
    x: Int;

    init() {
        self.x = 99;
    }

    // A compliant getter that only reads self.x
    get fun getX(): Int {
        return self.x;
    }
}
