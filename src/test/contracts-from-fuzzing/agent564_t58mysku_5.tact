struct Level3 {
    flag: Bool;
    num: Int;
}

struct Level2 {
    opt: Level3?;
    extra: Int;
}

struct Level1 {
    id: Int;
    nested: Level2;
}

contract ComplexNested {
    root: Level1;

    init() {
        self.root = Level1 {
            id: 1,
            nested: Level2 {
                opt: Level3 { flag: true, num: 100 },
                extra: 42
            }
        };
    }

    receive() {
        if (self.root.nested.opt != null) {
            self.root.nested.extra += 1;
        }
    }
}