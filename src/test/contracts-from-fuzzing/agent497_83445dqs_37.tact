contract ReassignInit {
    a: Int = 1;
    b: Bool = false;

    init() {
        self.a = 123;
        self.b = true;
    }
}