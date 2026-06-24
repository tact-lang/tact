struct Alpha { x: Int }
struct Beta { y: Bool }
struct Gamma { z: String }

struct Mix {
    a: Alpha;
    b: Beta?;
    c: Gamma;
}

contract Combo {
    val: Mix;

    init() {
        self.val = Mix{
            a: Alpha{x:1},
            b: null,
            c: Gamma{z:"ok"}
        };
    }
}