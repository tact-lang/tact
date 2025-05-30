contract ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
    f: String;
    g: String;
    h: String;
    i: String;
    j: String;

    init() {
        self.a = "a";
        self.b = "b";
        self.c = "c";
        self.d = "d";
        self.e = "e";
        self.f = "f";
        self.g = "g";
        self.h = "h";
        self.i = "i";
        self.j = "j";
    }

    receive() {
        self.a = "z";
    }
}