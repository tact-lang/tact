struct Alpha {
    x: Int;
}
struct Beta {
    y: Int;
}
struct Gamma {
    z: Int;
}

contract ManyStructFields {
    a: Alpha;
    b: Beta;
    g: Gamma;

    init() {
        self.a = Alpha{x:10};
        self.b = Beta{y:20};
        self.g = Gamma{z:30};
    }
}
