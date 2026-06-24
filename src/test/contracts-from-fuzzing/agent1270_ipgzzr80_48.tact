contract MixInitDefaults {
    x: Int = 1;
    y: Bool;
    s: String = "x";

    init() {
        self.y = true;
    }
}