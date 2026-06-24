struct DeeplyOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct WrapOpt {
    inner: DeeplyOpt?;
}

contract OptionalWraps {
    f1: WrapOpt = WrapOpt{inner:null};
    f2: WrapOpt = WrapOpt{inner:DeeplyOpt{x:null,y:null,z:null}};
    f3: WrapOpt = WrapOpt{inner:DeeplyOpt{x:1,y:true,z:"ok"}};

    init() {
        self.f1 = self.f1;
        self.f2 = self.f2;
        self.f3 = self.f3;
    }

    receive() {
        let _ = self.f1;
        let _ = self.f2;
        let _ = self.f3;
    }
}