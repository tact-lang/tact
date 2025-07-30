contract AssignOptNonOpt {
    a: Int?;
    b: Int;

    init() {
        self.a = null;
        self.b = 5;
        self.a = self.b;
    }
}
