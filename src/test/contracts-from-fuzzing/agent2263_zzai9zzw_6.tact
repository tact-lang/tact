contract Test {
    b: Bool?;

    init() {
        if (self.b != null) {
            require(false, "should be null by default");
        }
    }
}