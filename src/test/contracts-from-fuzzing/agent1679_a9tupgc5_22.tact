contract AssignmentOptional {
    a: Int?;

    init() {
        self.a = 42;
        self.a = null;
    }

    receive() {}
}