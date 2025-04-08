struct Level3 {
    x: Int;
    y: Bool;
}

struct Level2 {
    l3: Level3;
    opt: Bool?;
}

struct Level1 {
    l2: Level2;
    num: Int;
}

contract DeepChain {
    chain: Level1;

    init() {
        self.chain = Level1{
            l2: Level2{l3: Level3{x:1,y:true}, opt:null},
            num: 42,
        };
    }
}