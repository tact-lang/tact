struct Level1 {
    opt: Int?;
}

struct Level0 {
    nested: Level1?;
}

contract OptionalNested {
    data: Level0;

    init() {
        self.data = Level0{ nested: null };
    }
}