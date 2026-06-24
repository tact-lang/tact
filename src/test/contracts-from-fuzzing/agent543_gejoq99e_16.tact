struct CombOpt {
    x: Int?;
    y: Bool;
}

contract ManyCombOpt {
    a: CombOpt;
    b: CombOpt;
    c: CombOpt;
    d: CombOpt;

    init() {
        self.a=CombOpt{x:null,y:true};
        self.b=CombOpt{x:null,y:false};
        self.c=CombOpt{x:7,y:true};
        self.d=CombOpt{x:0,y:false};
    }
}
