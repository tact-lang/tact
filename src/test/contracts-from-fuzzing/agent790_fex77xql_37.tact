struct Alpha {
    x: Int;
}

struct Beta {
    y: Int;
}

struct Gamma {
    z: Int;
}

contract ManyFields {
    a: Alpha;
    b: Beta;
    c: Gamma;

    init() {
        self.a=Alpha{x:1};
        self.b=Beta{y:2};
        self.c=Gamma{z:3};
    }
}