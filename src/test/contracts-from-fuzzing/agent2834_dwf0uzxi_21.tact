contract BigOptionalMix {
    a:Int?; b:Bool; c:String?;
    d:Bool?; e:Int; f:String;
    g:Int?; h:Bool; i:String?;

    init() {
        self.a=null; self.b=true; self.c=null;
        self.d=null; self.e=5; self.f="x";
        self.g=null; self.h=false; self.i=null;
    }
}