contract MixedFieldKinds {
    x: Int = 1;
    y: Int?;
    z: Bool = true;
    s: String;

    init() {
        self.y = null;
        self.s = "abc";
    }
}