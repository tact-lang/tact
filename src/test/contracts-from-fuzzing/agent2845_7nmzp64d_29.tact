struct Alpha {
    p: Int;
}

struct Beta {
    p: Int;
}

struct Gamma {
    alpha: Alpha;
    beta: Beta;
}

contract NestedSameNames {
    g: Gamma;

    init() {
        self.g = Gamma{
            alpha: Alpha{p:1},
            beta: Beta{p:2}
        };
    }
}