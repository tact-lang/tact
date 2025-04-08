struct Alpha { a: Int }
struct Beta { b: Int }
struct Gamma { g: Int }
struct Delta { d: Int }

struct Combo {
    alpha: Alpha;
    beta: Beta;
    gamma: Gamma;
    delta: Delta;
}

contract MultiNested {
    combo: Combo;

    init() {
        self.combo = Combo{
            alpha: Alpha{ a:1 },
            beta: Beta{ b:2 },
            gamma: Gamma{ g:3 },
            delta: Delta{ d:4 }
        };
    }
}