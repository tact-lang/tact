struct DeepMixed {
    a: Int;
    b: Int?;
    c: InnerStruct;
    d: InnerOpt?;
}

struct InnerStruct {
    z: Bool;
}

struct InnerOpt {
    k: String?;
}

contract DeepMixedContract {
    f: DeepMixed;
    init() {
        self.f = DeepMixed{
            a:1,
            b:null,
            c:InnerStruct{z:true},
            d:null
        };
    }
}