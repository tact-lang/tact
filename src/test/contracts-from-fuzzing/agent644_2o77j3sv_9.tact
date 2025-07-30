contract DefaultedPersistent {
    counter: Int = 123;
    flag: Bool = false;

    init() {
        self.counter = 456;
        self.flag = true;
    }
}