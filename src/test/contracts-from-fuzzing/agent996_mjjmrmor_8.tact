contract TestStorage {
    value1: Int = 1;
    value2: Int = 2;
    value3: Int; // no default

    init() {
        self.value3 = 3;
    }
}