struct HasOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructArray {
    f0: HasOptional;
    f1: HasOptional;
    f2: HasOptional;
    init() {
        self.f0 = HasOptional{a:null,b:null,c:null};
        self.f1 = HasOptional{a:null,b:null,c:null};
        self.f2 = HasOptional{a:null,b:null,c:null};
    }
}

contract R {
    receive() {
        let dummy: OptionalStructArray? = null;
    }
}