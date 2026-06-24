contract MixedScalar {
    x: Int = 777;
    y: Bool = false;
    z: String = "hi";
    w: Address? = null;

    init() {
        self.x = 1;
        self.y = true;
        self.z = "bye";
        self.w = null;
    }
}