contract MinimalDefaultPrimitives {
    a: Int = 0;
    b: Bool = false;
    d: String = "";

    init() {
        self.a = 42;
        self.b = true;
        self.d = "done";
    }
}
