struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract OptionalMess {
    f1: DeepOpt;
    f2: DeepOpt;

    init() {
        self.f1 = DeepOpt{a:null,b:null,c:null,d:null};
        self.f2 = DeepOpt{a:null,b:null,c:null,d:null};
    }

    receive() {
        self.f1 = DeepOpt{a:1,b:true,c:2,d:false};
        self.f2 = DeepOpt{a:3,b:false,c:4,d:true};
    }
}