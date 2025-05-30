contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: Int = 2;
    d: String = "d";
    e: Bool = false;
    f: String = "f";
    g: Int = 3;
    h: Bool = true;
    i: String = "i";
    j: Int = 4;
    k: Bool = false;

    receive() {
        self.a + self.c + self.g + self.j;
    }
}