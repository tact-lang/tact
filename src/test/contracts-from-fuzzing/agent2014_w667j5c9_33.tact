contract MixDefaultsInits {
    x: Int = 1;
    y: Int;
    z: Int = 3;

    init() {
        self.y = 2;
    }
}