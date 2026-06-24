contract TestContract {
    a: Int;
    b: Int?;

    init() {
        self.a = 5;
        self.b = null;
    }

    get fun access_b(): Int {
        // force unwrap null optional
        return self.b!!;
    }
}