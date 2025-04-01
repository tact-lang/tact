contract Test(x: Int) {
    receive() {}

    get fun contractState(): Test? {
        if (self.x == 0) { return null }
        return self;
    }
}
