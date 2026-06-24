contract StringOptDefault {
    a: String = "x";
    b: String?;

    init() {
        self.b = null;
    }
}