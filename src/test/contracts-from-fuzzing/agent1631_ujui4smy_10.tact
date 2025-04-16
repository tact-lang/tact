struct OptNestDeep {
    innerOpt: Mid?;
}

struct Mid {
    innermost: Int?;
}

contract DeepOpt {
    o: OptNestDeep;

    init() {
        self.o = OptNestDeep{ innerOpt: null };
    }
}