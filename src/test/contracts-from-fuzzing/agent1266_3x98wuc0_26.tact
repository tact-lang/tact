contract OptionalAtEnd {
    x: Int = 1;
    y: String = "aaa";
    z: Bool? = null;
    init() {
        self.z = null;
    }
}