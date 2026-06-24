struct Level1 {
    lvl2: Level2;
    f1: Bool;
}

struct Level2 {
    lvl3: Level3;
    f2: Bool;
}

struct Level3 {
    a: Int?;
    b: Bool?;
}

contract DeepNestOptional {
    store: Level1 = Level1{
        lvl2: Level2{
            lvl3: Level3{ a:null, b:true },
            f2:true
        },
        f1:false
    };

    receive() {
        self.store = self.store;
    }
}