contract Test {
    receive() {}

    get fun contractState(cond: Bool): Test? {
        if (cond) { return null }
        return self;
    }
}
