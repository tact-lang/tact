contract FieldAssign {
    a: Int;
    b: Bool;

    init() {
        self.a = 5;
        self.b = false;
        self.a = 123;
        self.b = true;
    }
}