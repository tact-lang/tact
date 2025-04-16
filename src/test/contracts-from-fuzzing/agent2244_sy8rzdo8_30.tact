contract SerialMix {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int8;
    d: Int as int16;
    e: Int;
    b1: Bool;
    b2: Bool;
    s: String;
    so: String?;

    init() {
        self.a=1; self.b=300;
        self.c=-7; self.d=-70; self.e=-100;
        self.b1=true; self.b2=false;
        self.s="data"; self.so=null;
    }
}