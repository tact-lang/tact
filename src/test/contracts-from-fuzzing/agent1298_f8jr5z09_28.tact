// test long list of primitive persistent fields
contract LongPrim {
    a1:Int; a2:Int; a3:Int; a4:Int; a5:Int;
    b1:Bool; b2:Bool; b3:Bool; b4:Bool; b5:Bool;
    s1:String; s2:String; s3:String; s4:String; s5:String;
    init() {
        self.a1=1; self.a2=2; self.a3=3; self.a4=4; self.a5=5;
        self.b1=true; self.b2=false; self.b3=true; self.b4=false; self.b5=true;
        self.s1="a"; self.s2="b"; self.s3="c"; self.s4="d"; self.s5="e";
    }
}