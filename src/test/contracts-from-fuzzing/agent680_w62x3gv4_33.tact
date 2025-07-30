contract ManyBoolIntMix {
    a: Bool = true;
    b: Int;
    c: Bool = false;
    d: Int;
    e: Bool = true;
    f: Int;

    init() {
        self.b=1; self.d=2; self.f=3;
    }

    receive() {
        let _ = self.b + self.d + self.f;
    }
}