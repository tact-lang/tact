contract DefaultsAndOptionals {
    counter: Int?;
    flag: Bool = false;

    init() {
        self.counter = null;
    }
}