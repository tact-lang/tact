struct Primitives {
    a: Int;
    b: Bool;
    c: String;
}

struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Combo {
    prim: Primitives;
    opt: Optionals;
}

contract MixedKinds {
    combo: Combo;

    init() {
        self.combo = Combo{
            prim: Primitives{
                a: 5,
                b: true,
                c: "hi"
            },
            opt: Optionals{
                a: null,
                b: null,
                c: null
            }
        };
    }
}