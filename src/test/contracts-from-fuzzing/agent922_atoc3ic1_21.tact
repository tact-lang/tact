contract Flat {
    a1:Int; a2:Int; a3:Int; a4:Int; a5:Int;

    b1:Bool; b2:Bool; b3:Bool; b4:Bool; b5:Bool;

    c1:Int?; c2:Int?; c3:Int?; c4:Int?; c5:Int?;

    d1:String; d2:String; d3:String; d4:String; d5:String;

    init() {
        self.a1=1; self.a2=2; self.a3=3; self.a4=4; self.a5=5;
        self.b1=true; self.b2=false; self.b3=true; self.b4=false; self.b5=true;
        self.c1=null; self.c2=6; self.c3=7; self.c4=null; self.c5=8;
        self.d1="x"; self.d2="y"; self.d3="z"; self.d4="u"; self.d5="v";
    }
}