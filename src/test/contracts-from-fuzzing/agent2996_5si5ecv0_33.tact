contract MixSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int;
    e: Bool;
    f: Cell;

    init() {
        self.a=1; self.b=-2; self.c=3; self.d=4; self.e=true; self.f=emptyCell();
    }
}