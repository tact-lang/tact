contract MixedMultiple {
    int1:Int;
    bool1:Bool;
    string1:String;
    int2:Int;
    bool2:Bool;
    string2:String;
    oi:Int?;
    ob:Bool?;
    os:String?;

    init() {
        self.int1=1;
        self.bool1=true;
        self.string1="a";
        self.int2=2;
        self.bool2=false;
        self.string2="b";
        self.oi=null;
        self.ob=null;
        self.os=null;
    }
}