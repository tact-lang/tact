struct Alpha {
    x: Int;
}
struct Beta {
    y: Bool;
}
struct Gamma {
    z: String?;
}

struct Combo {
    a: Alpha;
    b: Beta?;
    c: Int;
    d: Gamma;
    e: Bool?;
}

contract TestContract {
    s: Combo;
    init() {
        self.s = Combo{
            a: Alpha{ x: 5 },
            b: null,
            c: 42,
            d: Gamma{ z: "hello" },
            e: true
        };
    }
}