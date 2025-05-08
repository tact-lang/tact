struct OptMix {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract ManyOptionals {
    field1: OptMix;
    field2: OptMix;

    init() {
        self.field1 = OptMix{s:null,i:null,b:null};
        self.field2 = OptMix{s:"ok",i:3,b:true};
    }
}
