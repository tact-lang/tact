contract MixedInit {
    x: Int = 1;
    y: Int = 2;
    z: Int;

    init() {
        self.y = 99;
        self.z = 42;
    }
}