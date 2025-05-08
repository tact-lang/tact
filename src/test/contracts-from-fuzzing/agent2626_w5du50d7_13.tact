struct Level1 {
    a: Int;
    b: Bool;
}

struct Level2 {
    x: Level1;
    y: Level1;
}

struct Level3 {
    m: Level2;
    n: Level2;
}

contract DuplicateNestedPaths {
    testVal: Level3;

    init() {
        self.testVal = Level3{
            m: Level2{
                x: Level1{a:1, b:true},
                y: Level1{a:2, b:false}
            },
            n: Level2{
                x: Level1{a:3, b:true},
                y: Level1{a:4, b:false}
            }
        };
    }
}