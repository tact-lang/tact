contract DefaultOptionalNulls {
    a: Int?;
    b: String?;

    init() {
        self.a = null;
        self.b = null;
    }
}