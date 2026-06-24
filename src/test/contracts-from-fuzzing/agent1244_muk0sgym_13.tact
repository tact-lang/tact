struct Sub {
    x: Int = 99;
    y: Bool = false;
}

struct Combo {
    optInt: Int?;
    optStr: String?;
    sub: Sub;
    val: Int;
    optSub: Sub?;
}

contract MixedAll {
    state: Combo;

    init() {
        self.state = Combo{
            optInt: null,
            optStr: null,
            sub: Sub{},
            val: -1,
            optSub: null,
        };
    }
}
