struct Level3 {
    data: String;
    opt: Int?;
}

struct Level2 {
    l3: Level3;
    flag: Bool;
    text: String;
}

struct Level1 {
    l2: Level2;
    val: Int;
}

contract NestedOpts {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{data: "deep", opt: null},
                flag: true,
                text: "lvl2",
            },
            val: 123,
        };
    }
}