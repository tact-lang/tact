// Struct nested inside optional, inside struct
struct Lvl3 {
    d: Int;
}

struct Lvl2 {
    deeper: Lvl3?;
}

struct Lvl1 {
    mid: Lvl2;
}

contract OptionalDeepNest {
    n: Lvl1;
    init() {
        self.n = Lvl1{
            mid: Lvl2{
                deeper: null
            }
        };
    }
}