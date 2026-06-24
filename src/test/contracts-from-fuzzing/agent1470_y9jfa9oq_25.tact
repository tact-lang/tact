struct First {
    a: Int = 1;
    b: Bool = false;
}

struct Second {
    c: Int;
    d: Bool;
    e: String?;
}

contract StructMix {
    f: First;
    g: Second;

    init() {
        self.f = First{};
        self.g = Second{c:2,d:true,e:null};
    }
}