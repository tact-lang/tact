contract ManyNestedDefaults {
    a:Int=1;
    b:Int=2;
    c:String="a";
    d:String="b";
    e:Bool=true;
    f:Bool=false;

    init() {
        self.a=11;
        self.b=22;
        self.c="x";
        self.d="y";
        self.e=false;
        self.f=true;
    }
}