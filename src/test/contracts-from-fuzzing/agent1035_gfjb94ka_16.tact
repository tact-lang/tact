contract RequiresInit {
    foo: Int;
    bar: Bool;
    init() {
        self.foo = 5;
        self.bar = true;
    }
    receive() {}
}