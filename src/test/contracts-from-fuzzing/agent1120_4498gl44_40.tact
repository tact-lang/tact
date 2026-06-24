struct ComboMix {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: Int?;
}

contract MixedOptions {
    data: ComboMix;
    init() {
        self.data = ComboMix{a:5,b:null,c:"C",d:true,e:7};
    }
}