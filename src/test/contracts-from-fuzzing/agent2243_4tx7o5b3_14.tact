contract DefaultVals {
    x: Int = 123;
    y: Bool = true;
    z: String = "abc";

    init() {
        self.x = 456;
        self.y = false;
        self.z = "def";
    }
}
