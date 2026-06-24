contract ManyBoolDefaults {
    a: Bool = false;
    b: Bool = true;
    c: Bool = false;
    d: Bool = true;
    e: Bool = false;
    f: Bool = true;
    g: Bool = false;
    h: Bool = true;
    i: Bool = false;
    j: Bool = true;

    receive() {
        let _ = self.b && self.d && self.f && self.h && self.j;
    }
}