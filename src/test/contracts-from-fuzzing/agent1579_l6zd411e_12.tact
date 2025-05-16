contract ManyVars {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Bool = true;
    g: Bool = false;
    h: String = "one";
    i: String = "two";
    j: String = "three";

    init() {
        self.a=10; self.b=20; self.c=30; self.d=40; self.e=50;
        self.f=false; self.g=true;
        self.h="A"; self.i="B"; self.j="C";
    }

    receive() {
        self.a = self.a + 1;
    }
}