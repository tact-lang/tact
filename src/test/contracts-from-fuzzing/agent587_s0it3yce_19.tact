contract ManyOptionalsPrimitives {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
    receive() {
        if(self.a != null){ let _ = self.a!!; }
        if(self.b != null){ let _ = self.b!!; }
        if(self.c != null){ let _ = self.c!!; }
        if(self.d != null){ let _ = self.d!!; }
    }
}