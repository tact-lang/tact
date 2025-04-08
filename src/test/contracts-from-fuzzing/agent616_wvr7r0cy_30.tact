struct Lvl3 {
    x: String?;
    y: Int?;
}

struct Lvl2 {
    nest: Lvl3?;
}

struct Lvl1 {
    deep: Lvl2?;
}

contract DeepOpts {
    f: Lvl1?;

    init() {
        self.f = null;
    }
}