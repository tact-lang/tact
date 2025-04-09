struct OptionNest {
    val: Int?;
    nested: Bool?;
}

struct Level2 {
    opt: OptionNest?;
}

contract OptDeep {
    s: Level2;

    init() {
        self.s = Level2{
            opt:null
        };
    }
}