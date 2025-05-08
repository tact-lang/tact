contract OptionalAssignment {
    a: Int?;

    init() {
        self.a = null;
        self.a = 42;
        self.a = null;
    }
    receive(){}
}