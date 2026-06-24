struct Level3 {
    deep: Int;
}

struct Level2 {
    l3: Level3;
    flag: Bool;
}

struct Level1 {
    l2: Level2;
    message: String;
}

contract NestedDeep {
    nested: Level1 = Level1{
        l2: Level2{
            l3: Level3{
                deep: 100,
            },
            flag: true,
        },
        message: "deep",
    };

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{
                    deep: 555,
                },
                flag: false,
            },
            message: "changed",
        };
    }
}