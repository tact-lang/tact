contract Test35 {
    a: Int;
    b: Bool;

    init() {
        self.a = 123;
        self.b = false;
    }

    get fun show(): Int {
        return self.a;
    }
}