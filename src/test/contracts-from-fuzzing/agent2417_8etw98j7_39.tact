contract MixedSerialization {
    a: Int as uint8;
    b: Int;
    c: Int as int16;
    d: Int?;

    init() {
        self.a=8; self.b=1000; self.c=55; self.d=null;
    }
}
