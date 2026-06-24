// persistent state with very long list of fields, mix of types, no defaults
contract WayTooManyFields {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Bool; g: Bool; h: Bool; i: Bool; j: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    o1:Int?; o2:Int?; o3:Int?; o4:Int?; o5:Int?;
    ob1:Bool?; ob2:Bool?; ob3:Bool?; ob4:Bool?; ob5:Bool?;
    os1:String?; os2:String?; os3:String?; os4:String?; os5:String?;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5;
        self.f=true; self.g=false; self.h=true; self.i=false; self.j=true;
        self.s1="A"; self.s2="B"; self.s3="C"; self.s4="D"; self.s5="E";
        self.o1=null; self.o2=null; self.o3=null; self.o4=null; self.o5=null;
        self.ob1=null; self.ob2=null; self.ob3=null; self.ob4=null; self.ob5=null;
        self.os1=null; self.os2=null; self.os3=null; self.os4=null; self.os5=null;
    }
}