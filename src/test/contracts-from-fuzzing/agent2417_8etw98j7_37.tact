contract BoolStringsInts {
    b1:Bool; s1:String; i1:Int;
    b2:Bool?; s2:String; i2:Int?;

    init() {
        self.b1=true; self.s1="x"; self.i1=1;
        self.b2=null; self.s2="y"; self.i2=null;
    }
}
