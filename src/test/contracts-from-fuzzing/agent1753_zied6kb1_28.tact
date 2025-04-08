struct Rec {
    a: Int;
    b: Bool;
    c: String;
}

contract LargeMix {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: String;
    f5: Bool;
    f6: Int;
    f7: Bool;
    f8: String;
    f9: Rec;
    f10: Int?;
    f11: String?;
    f12: Bool?;

    init() {
        self.f1=1;
        self.f2=true;
        self.f3=3;
        self.f4="s";
        self.f5=false;
        self.f6=6;
        self.f7=true;
        self.f8="t";
        self.f9=Rec{a:9,b:true,c:"c"};
        self.f10=null;
        self.f11=null;
        self.f12=null;
    }
}