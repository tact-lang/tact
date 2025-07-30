struct Level0 {
    x: Int = 0;
}

struct Level1 {
    child: Level0;
}

struct Level2 {
    child: Level1;
}

struct Level3 {
    child: Level2;
}

struct Level4 {
    child: Level3; 
}

struct Level5 {
    child: Level4;
}


contract Chain5 {
    root: Level5;
    init() {
        self.root = Level5{
            child: Level4{
                child: Level3{
                    child: Level2{
                        child: Level1{
                            child: Level0{ x: 42 }
                        }
                    }
                }
            }
        };
    }
    receive(){}
}