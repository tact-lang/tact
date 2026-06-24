struct Lvl3 {
    a: Int? = null;
    b: Bool = true;
}

struct Lvl2 {
    nested: Lvl3? = null;
    msg: String = "lvl2";
}

struct Lvl1 {
    down: Lvl2? = null;
    num: Int = 7;
}

contract DefaultsNestOpt {
    root: Lvl1;

    init() {
        self.root = Lvl1{
            down: null,
            num: 42
        };
    }
}
