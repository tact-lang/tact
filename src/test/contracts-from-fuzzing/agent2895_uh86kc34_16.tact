struct DeepOpt {
    inner: Int?;
}

struct Lvl2 {
    d: DeepOpt?;
}

contract NestedOptInStructOpt {
    s: Lvl2?;

    init() {
        self.s = null;
    }
}
