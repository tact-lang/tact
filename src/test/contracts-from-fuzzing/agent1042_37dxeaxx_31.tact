struct ManyMixOptional {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
}

contract ComplexOptionalMix {
    mix: ManyMixOptional;
    init() {
        self.mix = ManyMixOptional{a:1,b:true,c:null,d:false};
    }
}