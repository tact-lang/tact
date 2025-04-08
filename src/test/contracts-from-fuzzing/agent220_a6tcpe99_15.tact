contract WideIntSerialize {
    biggie: Int as int255;

    init() {
        self.biggie = 0;
    }

    receive() {}
}