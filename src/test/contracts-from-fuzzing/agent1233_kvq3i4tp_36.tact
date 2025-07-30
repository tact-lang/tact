struct S {
    a: Int; 
    b: Int?;
}

contract OptionalMix {
    f: S;

    init() {
        self.f = S{a:1,b:null};
    }
}