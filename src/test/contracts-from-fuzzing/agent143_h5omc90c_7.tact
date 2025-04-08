struct Level1 {
    foo: Int;
    bar: Bool;
}

struct Level2 {
    nested: Level1;
}

contract OptInDeepNested {
    innerOpt: Level2?;

    init() {
        self.innerOpt = null;
    }
}