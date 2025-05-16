contract ManyPersistentFields {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Bool = true;
    g: Bool = false;
    h: String = "h";
    i: String = "i";
    j: String = "j";
    receive() {
        let _ = self.a + self.b + self.c + self.d + self.e;
    }
}