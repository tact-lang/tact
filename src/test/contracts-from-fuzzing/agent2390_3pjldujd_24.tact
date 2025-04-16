struct Duo {
    a: Int;
    b: Bool;
}

struct Trio {
    d1: Duo;
    d2: Duo;
    d3: Duo;
}

contract MultiNestedStruct {
    t: Trio;
    init() {
        self.t = Trio{
            d1: Duo{ a:1, b:true },
            d2: Duo{ a:2, b:false },
            d3: Duo{ a:3, b:true }
        };
    }
}