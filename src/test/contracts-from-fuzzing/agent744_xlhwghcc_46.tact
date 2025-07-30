contract OverloadedDefaults {
    a:Int=5;
    b:Bool=false;
    c:String="xyz";
    d:Int?=null;
    e:Bool?=null;
    f:String?=null;

    init() {
        self.a=10;
        self.b=true;
        self.c="abc";
        self.d=20;
        self.e=true;
        self.f="def";
    }
}