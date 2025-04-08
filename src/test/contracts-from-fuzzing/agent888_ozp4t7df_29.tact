struct Compound {
    a: Int; b: Bool; c: String;
    d: Int?; e: Bool?; f: String?;
}

contract CompoundFields {
    comp: Compound;

    init() {
        self.comp = Compound{
            a:1,b:true,c:"txt",d:null,e:null,f:null
        };
    }
}