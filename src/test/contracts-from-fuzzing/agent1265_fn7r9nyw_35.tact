struct Alpha {
    a: Int;
}

struct Beta {
    b: Bool;
}

struct Gamma {
    g: String;
}

contract ManyStructs {
    x: Alpha;
    y: Beta;
    z: Gamma;

    init() {
        self.x = Alpha{a:1};
        self.y = Beta{b:true};
        self.z = Gamma{g:""};
    }
}