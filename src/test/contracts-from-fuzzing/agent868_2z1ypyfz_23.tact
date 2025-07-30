contract ReassignInit {
    foo: Int = 5;
    bar: Bool = false;

    init() {
        self.foo = 10;
        self.bar = true;
    }
}