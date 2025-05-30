contract InitDefaultBoth {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Address? = null;

    init() {
        self.a = 42;
        self.d = null;
    }

    receive() {
        let _ = self.a;
    }
}