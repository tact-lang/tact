struct Level3 {
    tag: String;
    code: Int;
}

struct Level2 {
    info: Level3;
    flag: Bool;
}

struct Level1 {
    data: Level2;
    count: Int;
}

contract Deep3 {
    all: Level1 = Level1{
        data: Level2{
            info: Level3{tag:"x", code:42},
            flag:true
        },
        count: 100
    };

    init() {
        self.all = Level1{
            data: Level2{
                info: Level3{tag:"y", code:7},
                flag:false
            },
            count: 200
        };
    }
}