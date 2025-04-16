contract TestContract {
    a: Int;
    b: Int?;

    init() {
        self.a = 5;
        self.b = null;
    }

    get fun data(): Int? {
        return self.b;
    }
}