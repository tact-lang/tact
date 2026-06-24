struct Inner {
    x: Int;
    y: Bool?;
}

struct InnerOpt {
    msg: String?;
    num: Int?;
}

contract KitchenSink {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: Inner;
    f6: Inner?;
    f7: InnerOpt;
    f8: InnerOpt?;

    init() {
        self.f1 = 10;
        self.f2 = null;
        self.f3 = false;
        self.f4 = true;
        self.f5 = Inner{x:1,y:null};
        self.f6 = null;
        self.f7 = InnerOpt{msg:null,num:42};
        self.f8 = InnerOpt{msg:"hi",num:null};
    }
}