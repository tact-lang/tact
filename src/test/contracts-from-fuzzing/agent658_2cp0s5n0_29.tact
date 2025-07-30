struct Alpha {
    a: Int;
    b: Bool;
}

struct Beta {
    c: String;
    d: Address;
}

struct Gamma {
    x: Alpha;
    y: Beta;
}

contract CrossNest {
    g: Gamma;

    init() {
        self.g = Gamma{
            x: Alpha{a:1,b:true},
            y: Beta{c:"hi",d:myAddress()}
        };
    }
}