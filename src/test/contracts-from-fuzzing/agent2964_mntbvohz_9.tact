struct LargeNested {
    level1: Level1;
}

struct Level1 {
    a: Int;
    b: Level2;
}

struct Level2 {
    c: Int?;
    d: Level3;
}

struct Level3 {
    e: Bool;
    f: Level4;
}

struct Level4 {
    g: String;
    h: Int?;
}

contract DeepContract {
    data: LargeNested;
    
    init() {
        self.data = LargeNested{
            level1: Level1{
                a:1,
                b: Level2{
                    c:null,
                    d: Level3{
                        e:true,
                        f: Level4{
                            g:"hello",
                            h:null
                        }
                    }
                }
            }
        };
    }
}