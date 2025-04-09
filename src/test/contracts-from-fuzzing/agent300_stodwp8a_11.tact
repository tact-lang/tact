struct Level3 {
    x: Int;
    y: Bool;
    z: String;
}

struct Level2 {
    left: Level3;
    right: Level3;
}

struct Level1 {
    l: Level2;
    r: Level2;
}

contract TestContract {
    data: Level1;
    
    init() {
        self.data = Level1{
            l: Level2{
                left: Level3{x:1, y:true, z:"a"},
                right: Level3{x:2, y:false, z:"b"},
            },
            r: Level2{
                left: Level3{x:3, y:true, z:"c"},
                right: Level3{x:4, y:false, z:"d"},
            }
        };
    }
}