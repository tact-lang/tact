struct Alpha { x: Int }
struct Beta { y: Int }
struct Gamma { z: Int }

struct Combo {
    aa: Alpha;
    bb: Beta;
    gg: Gamma;
}

contract MultiCombo {
    content: Combo;

    init() {
        self.content = Combo{
            aa: Alpha{x:1},
            bb: Beta{y:2},
            gg: Gamma{z:3}
        };
    }
}
