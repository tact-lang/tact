struct MultiLevelInner {
    a: Int;
    b: Bool;
    c: Level2;
}

struct Level2 {
    d: Int?;
    e: Bool?;
    f: Level3;
}

struct Level3 {
    g: Int;
    h: Bool?;
}

contract MultiNestedDeep {
    s: MultiLevelInner;

    init() {
        self.s = MultiLevelInner{
            a: 1,
            b: false,
            c: Level2{
                d: null,
                e: null,
                f: Level3{
                    g: 7,
                    h: null
                }
            }
        };
    }
}