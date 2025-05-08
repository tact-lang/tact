contract OptionalInContract {
    counter: Int?;
    flag: Bool = true;

    init() {
        self.counter = null;
    }
}