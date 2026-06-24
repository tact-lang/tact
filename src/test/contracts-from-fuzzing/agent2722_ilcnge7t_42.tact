contract MixedDefaults {
    x: Int = 5;
    y: Bool;
    z: String = "str";
    o1: Int? = null;
    o2: Bool?;
    o3: String? = null;

    init() {
        self.y = true;
        self.o2 = false;
    }
}