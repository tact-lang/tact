contract DefaultsAndNulls {
    x: Int = 1;
    y: Int?;
    z: Bool? = null;
    s: String = "foo";

    init() {
        self.y = 42;
    }
}