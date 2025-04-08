contract StringAndBool {
    a: String = "foo";
    b: Bool = false;

    init() {
        self.a = "bar";
        self.b = true;
    }
}