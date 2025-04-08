struct Alpha {
    x: Int;
    y: Bool?;
}

struct Beta {
    s1: Alpha;
    s2: Alpha;
}

struct Gamma {
    v: Beta;
}

contract TestGamma {
    g: Gamma;

    init() {
        self.g = Gamma{
            v: Beta{
                s1: Alpha{x:1,y:true},
                s2: Alpha{x:2,y:null}
            }
        };
    }
}
