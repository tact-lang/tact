struct Level3 {
    value: Int;
}

struct Level2 {
    mid: Level3;
}

struct Level1 {
    top: Level2;
}

contract Test {
    deep: Level1;
    
    init() {
        self.deep = Level1{
            top: Level2{
                mid: Level3{
                    value: 123
                }
            }
        };
    }
}