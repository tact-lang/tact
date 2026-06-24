struct OptionalMix {
    aa: Int?;
    bb: Bool?;
    cc: String?;
}

struct MandatoryMix {
    x: Int;
    y: Bool;
    z: String;
}

contract ManyOptAndMandFields {
    opt: OptionalMix;
    mand: MandatoryMix;

    init() {
        self.opt = OptionalMix{ aa:null, bb:null, cc:null };
        self.mand = MandatoryMix{ x:10, y:true, z:"ok" };
    }
}