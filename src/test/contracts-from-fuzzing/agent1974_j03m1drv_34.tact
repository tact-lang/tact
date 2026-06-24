struct AB {
    a: Int?;
    b: Bool;
}

contract OptionalMix {
    f1: AB?;
    f2: AB;

    init() {
        self.f1 = AB{ a:null, b:true };
        self.f2 = AB{ a:null, b:false };
    }
}
