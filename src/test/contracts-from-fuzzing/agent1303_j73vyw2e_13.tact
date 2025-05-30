struct Combo {
    int1: Int;
    bool1: Bool;
    opt1: Int?;
    int2: Int;
    bool2: Bool?;
    opt2: Int?;
    int3: Int;
    bool3: Bool;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            int1: 1,
            bool1: false,
            opt1: null,
            int2: 2,
            bool2: null,
            opt2: null,
            int3: 3,
            bool3: true,
        };
    }
}