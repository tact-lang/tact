struct Inner {
    x: Int;
    y: Bool?;
}

contract ArrayLikeFields {
    f0: Inner;
    f1: Inner;
    f2: Inner;
    f3: Inner;
    f4: Inner;
    f5: Inner;
    f6: Inner;
    f7: Inner;
    f8: Inner;
    f9: Inner;

    init() {
        self.f0 = Inner{x:0, y:null};
        self.f1 = Inner{x:1, y:true};
        self.f2 = Inner{x:2, y:null};
        self.f3 = Inner{x:3, y:true};
        self.f4 = Inner{x:4, y:null};
        self.f5 = Inner{x:5, y:true};
        self.f6 = Inner{x:6, y:null};
        self.f7 = Inner{x:7, y:true};
        self.f8 = Inner{x:8, y:null};
        self.f9 = Inner{x:9, y:true};
    }
}