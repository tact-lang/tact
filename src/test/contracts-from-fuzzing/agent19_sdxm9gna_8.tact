contract Test {
    a: Int?;
    init() {
        self.a = 10; // see if Int is implicitly cast to Int?
    }
}