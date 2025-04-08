struct Lvl3 {
    x: Int;
    flag: Bool;
}

struct Lvl2 {
    nested: Lvl3?;
}

struct Lvl1 {
    nested: Lvl2;
}

contract DeepOptionalMix {
    data: Lvl1;

    init() {
        self.data = Lvl1{
            nested: Lvl2{
                nested: null
            }
        };
    }
}
