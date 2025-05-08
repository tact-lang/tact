struct BigFields {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Int; g: Int; h: Int; i: Int; j: Int;
    k: Int; l: Int; m: Int; n: Int; o: Int;
}

contract LotsOfOptionals {
    f1: BigFields?;
    f2: BigFields?;
    f3: BigFields?;
    f4: BigFields?;
    
    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
    }
}