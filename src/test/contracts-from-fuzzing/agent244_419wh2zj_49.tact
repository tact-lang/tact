// Contract with struct containing mix of defaults and optionals deeply nested

struct Lvl3 {
    a: Int?;
    b: Bool = true;
}

struct Lvl2 {
    l3: Lvl3?;
    msg: String?;
}

struct Lvl1 {
    l2: Lvl2 = Lvl2{};
    f: Bool;
}

contract MixDefaultsDeep {
    data: Lvl1;

    init() {
        self.data = Lvl1{
            l2: Lvl2{
                l3: null,
                msg: null
            },
            f: false
        };
    }
}