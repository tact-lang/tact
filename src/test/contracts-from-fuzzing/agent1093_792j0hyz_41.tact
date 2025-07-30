struct LevelOne {
    a: Int;
    b: Bool;
}

struct LevelTwo {
    l1: LevelOne;
    c: String;
}

struct LevelThree {
    l2: LevelTwo;
    d: Int?
}

contract ComposeDeep {
    val: LevelThree;

    init() {
        self.val = LevelThree{
            l2: LevelTwo{
                l1: LevelOne{a:1,b:true},
                c: "str"
            },
            d: null
        };
    }
}