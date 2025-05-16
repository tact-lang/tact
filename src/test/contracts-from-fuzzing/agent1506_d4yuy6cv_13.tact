struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Combo {
    f1: Opts;
    f2: Opts;
}

contract DeepOptional {
    combo: Combo;

    init() {
        self.combo = Combo{
            f1: Opts{ a:null, b:true, c:"hi" },
            f2: Opts{ a:2, b:null, c:null }
        };
    }
}
// nested struct-level optionals multiple times