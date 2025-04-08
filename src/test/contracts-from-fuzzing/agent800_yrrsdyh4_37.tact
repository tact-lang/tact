contract OnlyDeferredDefaults {
    counter: Int;
    flag: Bool;

    init() {
        self.counter = 0;
        self.flag = false;
    }
}