struct Alpha {
    x: Int as uint8;
    flag: Bool;
}

struct Beta {
    num: Int as int32;
    toggle: Bool;
}

struct Gamma {
    val: Int;
    yes: Bool;
}

struct Combo {
    a: Alpha;
    b: Beta;
    c: Gamma;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo {
            a: Alpha{ x: 200, flag: true },
            b: Beta{ num: -123456, toggle: false },
            c: Gamma{ val: 123, yes: true }
        };
    }
}