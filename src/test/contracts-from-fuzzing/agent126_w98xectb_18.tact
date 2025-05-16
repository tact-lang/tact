struct Alpha {
    a: Int;
}
struct Beta {
    b: Int;
}
struct Gamma {
    g: Int;
}

struct Combo {
    alpha: Alpha;
    beta: Beta;
    gamma: Gamma;
}

contract CombineStructs {
    combos: Combo;

    init() {
        self.combos = Combo{
            alpha: Alpha{a:1},
            beta: Beta{b:2},
            gamma: Gamma{g:3}
        };
    }
}