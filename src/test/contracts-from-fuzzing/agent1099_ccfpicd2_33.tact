contract ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = null;

    init() {
        self.a=42; self.b=false; self.c=10; self.d=true;
    }
}