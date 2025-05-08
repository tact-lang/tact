struct Level4 {
    data: String?;
}

struct Level3 {
    nested: Level4;
    optNested: Level4?;
}

struct Level2 {
    lvl3: Level3;
    val: Bool;
}

struct Level1 {
    lvl2: Level2;
    title: String;
}

contract MultiLevelNest {
    deep: Level1 = Level1{
        lvl2: Level2{
            lvl3: Level3{nested: Level4{data:null}, optNested:null},
            val: false
        },
        title: "start"
    };

    init() {
        self.deep = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    nested: Level4{data: "abc"},
                    optNested: Level4{data:null}
                },
                val: true
            },
            title: "changed"
        };
    }
}
