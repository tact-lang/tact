struct MixedDefaults {
    val1: Int = 1;
    val2: Int;
    flag: Bool = false;
}

struct Wrap {
    m: MixedDefaults;
}

contract Test23 {
    w: Wrap;

    init() {
        self.w = Wrap{
            m: MixedDefaults{
                val2: 999,
            }
        };
    }

    receive() {}
}