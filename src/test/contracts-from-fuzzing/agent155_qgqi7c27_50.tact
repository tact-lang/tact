contract SerializeMixBoolsInts {
    a: Bool;
    b: Int as uint8;
    c: Bool;
    d: Int as int8;
    init() {
        self.a=true; self.b=200; self.c=false; self.d=-7;
    }
}