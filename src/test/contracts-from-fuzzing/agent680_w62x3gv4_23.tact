contract MixedInitDefaulted {
    foo: Int = 5;
    bar: Int;
    baz: Bool = false;
    qux: Bool;
    msg: String = "default";
    note: String;

    init() {
        self.bar = 42;
        self.qux = true;
        self.note = "hi";
    }

    receive() {
        let _ = self.bar + 1;
    }
}