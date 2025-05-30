contract InitAssignMix {
    a: Int;
    b: Int = 4;

    init() {
        self.a = 5;
        self.b = 6;
    }
}