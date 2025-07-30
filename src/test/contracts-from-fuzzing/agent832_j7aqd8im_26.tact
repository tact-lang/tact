contract ManyBooleans {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
    d: Bool = false;
    e: Bool = true;
    receive() {
        let _ = self.a && self.c;
    }
}