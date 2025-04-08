struct MultipleLevels {
    n1: Int;
    n2: Int?
}

struct LevelOuter {
    inner: MultipleLevels?;
}

contract OptionalAtOuter {
    state: LevelOuter;

    init() {
        self.state = LevelOuter{ inner: MultipleLevels{ n1: 5, n2: null } };
    }
}