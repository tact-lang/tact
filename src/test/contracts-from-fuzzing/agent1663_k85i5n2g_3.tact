struct Level3 {
    val: Int?;
    flag: Bool;
}

struct Level2 {
    l3: Level3;
    str: String;
}

struct Level1 {
    l2: Level2;
    num: Int;
    opt: Bool?;
}

contract MultiNested {
    state: Level1;
    init() {
        self.state = Level1{
            l2: Level2{
                l3: Level3{val:null, flag:true},
                str:"hello"
            },
            num: 10,
            opt: false
        };
    }
}