struct MidOpt {
    a:Int;
    b:InnerOpt?;
    c:Bool;
}

struct InnerOpt {
    x:Int?;
    y:String?;
}

contract TestMidOpt {
    val: MidOpt = MidOpt{a:1,b:null,c:false};

    init() {
        self.val=MidOpt{
            a:2,
            b:InnerOpt{x:42,y:"abc"},
            c:true
        };
    }
}
