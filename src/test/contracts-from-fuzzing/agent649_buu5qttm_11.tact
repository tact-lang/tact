contract NestedStructDefault {
    a: Int = 10;
    b: Int;
    init() {
        self.b = 5;
    }
    receive() {
        let _ = self.b;
    }
}