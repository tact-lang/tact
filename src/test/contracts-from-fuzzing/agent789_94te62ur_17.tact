contract CrossAssignInit {
    a: Int;
    b: Int;

    init() {
        self.a = 1;
        self.b = self.a + 41;
    }
}
