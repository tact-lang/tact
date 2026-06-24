struct Level3 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    nest: Level3;
    opt_int: Int?;
}

struct Level1 {
    lvl2: Level2;
    flag: Bool;
}

contract MultiLevelNested {
    data: Level1;

    init() {
        self.data = Level1{
            lvl2: Level2{
                nest: Level3{ a:10, b:true },
                opt_int:null
            },
            flag:false
        };
    }
}