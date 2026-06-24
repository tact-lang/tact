struct Alpha {
    x: Int;
}

struct Beta {
    y: Bool;
}

struct Gamma {
    z: String;
}

contract DeepFields {
    a: Alpha;
    b: Beta;
    c: Gamma;

    init() {
        self.a = Alpha{x: 1};
        self.b = Beta{y: false};
        self.c = Gamma{z: "deep"};
    }
}