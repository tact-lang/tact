contract BoolTypes {
    a: Bool = true;
    b: Bool? = null;

    init() {
        self.b = false;
    }

    receive() {
        self.a = true;
    }
}