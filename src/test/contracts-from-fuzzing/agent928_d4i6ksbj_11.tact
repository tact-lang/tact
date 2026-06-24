struct Complex {
    x: Int;
    y: Bool;
    z: String;
    optI: Int?;
    optB: Bool?;
    optS: String?;
}

contract ComplexFields {
    f1: Complex;
    f2: Complex;

    init() {
        self.f1 = Complex{x:1,y:true,z:"a",optI:null,optB:null,optS:null};
        self.f2 = Complex{x:2,y:false,z:"b",optI:5,optB:true,optS:"opt"};
    }
}