contract TestUnusedGetter {
    x: Int = 5;

    receive() {}

    // Getter that is never explicitly called
    get fun unused(): Int {
        return self.x;
    }
}
