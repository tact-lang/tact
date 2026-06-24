contract DefaultsConflicting {
    x: Int = 1;
    init() {
        self.x = 2;
    }
}