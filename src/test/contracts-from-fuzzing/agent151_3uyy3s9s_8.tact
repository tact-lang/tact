struct Level3 {
    f1: Int; f2: Bool; f3: String;
}

struct Level2 {
    l3a: Level3; l3b: Level3;
}

struct Level1 {
    l2a: Level2; l2b: Level2;
}

contract TestWideDeep {
    bigStruct: Level1;

    init() {
        self.bigStruct = Level1{
            l2a: Level2{
                l3a: Level3{ f1:1, f2:true, f3:"a" },
                l3b: Level3{ f1:2, f2:false, f3:"b" }
            },
            l2b: Level2{
                l3a: Level3{ f1:3, f2:true, f3:"c" },
                l3b: Level3{ f1:4, f2:false, f3:"d" }
            }
        };
    }
}