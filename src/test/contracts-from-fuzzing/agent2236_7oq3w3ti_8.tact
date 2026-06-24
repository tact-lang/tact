struct StringNest {
    inner: String;
    optInner: String?;
}

struct Level2 {
    sn: StringNest;
    num: Int;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract StringNesting {
    top: Level1;

    init() {
        self.top = Level1{
            l2: Level2{
                sn: StringNest{
                    inner: "test",
                    optInner: null
                },
                num: 99
            },
            flag: true
        };
    }
}