contract MixPrimitives {
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool?;
    s1: String;
    s2: String?;

    init() {
        self.i1=1; self.i2=null; self.b1=true; self.b2=null; self.s1="hello"; self.s2=null;
    }

    receive() {}
}