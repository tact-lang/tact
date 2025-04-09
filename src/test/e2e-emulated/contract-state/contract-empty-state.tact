contract Test {
    receive() {}

    get fun contractState(): Test {
        return self;
    }
}
