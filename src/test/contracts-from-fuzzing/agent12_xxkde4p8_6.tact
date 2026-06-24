struct Level3 {
    field: Int;
    data: map<Int, Int>; // using Int which is allowed as per docs
}

struct Level2 {
    nested: Level3;
    extra: Int;
}

struct Level1 {
    level: Level2;
    opt: Int?;
}

contract TestDeepOptionalMapValid {
    receive() {
        // Instantiate Level1 with nested Level2 and Level3
        let s: Level1 = Level1 {
            level: Level2 {
                nested: Level3 {
                    field: 777,
                    data: emptyMap()
                },
                extra: 42
            },
            opt: 7
        };
        // Access fields to ensure the struct is fully compiled and used
        s.level.nested.field;
        if (s.opt != null) {
            s.opt!!;
        }
        let _ = s.level.nested.data;
    }
}
