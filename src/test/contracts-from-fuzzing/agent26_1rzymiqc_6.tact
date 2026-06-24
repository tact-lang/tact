contract TestGetter3 {
    x: Int;

    init() {
        self.x = 7;
    }

    // Getter that computes a new value without modifying state
    get fun computedX(): Int {
        let y = self.x + 10;
        return y;
    }
}
