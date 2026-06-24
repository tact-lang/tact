contract OptionalAtStart {
    x: Int? = null;
    y: Int = 42;
    z: String = "abc";

    init() {
        self.x = null;
        self.y = 5;
        self.z = "def";
    }
}