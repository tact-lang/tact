struct S {
    x: Int;
    y: Int?;
    z: Bool?;
}

contract OptionalMix {
    f1: S?;
    f2: S;

    init() {
        self.f1 = S{x:1, y:null, z:true};
        self.f2 = S{x:2, y:null, z:null};
    }
}
