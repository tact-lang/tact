contract SingleBoolInt {
    a: Bool;
    b: Int;

    init() {
        self.a = true;
        self.b = 123;
    }

    receive() {
        // to ensure contract is compiled
        let x = self.a;
        let y = self.b;
    }
}