contract FlatMany {
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool?;
    i3: Int;
    b3: Bool?;

    init() {
        self.i1=1; self.i2=null; self.b1=true;
        self.b2=null; self.i3=3; self.b3=null;
    }
}