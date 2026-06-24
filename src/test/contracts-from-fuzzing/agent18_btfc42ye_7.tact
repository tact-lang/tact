contract TestGetModification {
    value: Int;

    init() {
        self.value = 0;
    }

    get fun increment(): Int {
        self.value = self.value + 1;
        return self.value;
    }
}
