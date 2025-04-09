contract DefaultVals {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int?;

    init() {
        self.d = null;
    }
}
