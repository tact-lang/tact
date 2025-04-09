contract OptionalNestedStrings {
    nestedOpt: NestedOpt?;

    init() {
        self.nestedOpt = null;
    }
}

struct NestedOpt {
    levelOne: LevelOne?;
}

struct LevelOne {
    info: String;
    flag: Bool;
}