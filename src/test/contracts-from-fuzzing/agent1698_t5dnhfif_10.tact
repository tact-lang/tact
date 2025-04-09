struct Alpha {
    x: Int;
}

struct Beta {
    y: Int;
    a: Alpha;
}

struct Gamma {
    z: Int;
    b: Beta;
}

contract Test {
    g: Gamma;
    init() {
        self.g = Gamma{z:3,b:Beta{y:2,a:Alpha{x:1}}};
    }
}