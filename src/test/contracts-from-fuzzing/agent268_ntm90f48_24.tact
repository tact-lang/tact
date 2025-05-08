struct Level3 {
    i:Int;
}

struct Level2 {
    l3:Level3;
}

struct Level1 {
    l2:Level2;
}

contract ContractDeep {
    deep: Level1;
    init() {
        self.deep = Level1{
            l2: Level2{
                l3: Level3{ i: 55 }
            }
        };
    }
}