contract MixedDefaults {
    a: Int = 5;
    b: Int;
    c: Bool = true;
    d: Bool;

    init() {
        self.b=10; self.d=false;
    }
}