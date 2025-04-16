struct DeepA { 
    a1: Int; 
    a2: String;
}

struct DeepB { 
    b1: DeepA;
    b2: String;
}

struct DeepC {
    c1: DeepB; 
    c2: Bool;
}

contract MultiDeep {
    val: DeepC;

    init() {
        self.val = DeepC{ c1: DeepB{ b1: DeepA{a1:1,a2:"2"}, b2: "3" }, c2:false };
    }
}