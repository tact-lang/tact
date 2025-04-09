struct MixPrimitives {
    i: Int;
    b: Bool;
    s: String;
}

contract MultiMix {
    m1: MixPrimitives;
    m2: MixPrimitives;
    m3: MixPrimitives;

    init() {
        self.m1 = MixPrimitives{i:1,b:true,s:"a"};
        self.m2 = MixPrimitives{i:2,b:false,s:"b"};
        self.m3 = MixPrimitives{i:3,b:true,s:"c"};
    }
}