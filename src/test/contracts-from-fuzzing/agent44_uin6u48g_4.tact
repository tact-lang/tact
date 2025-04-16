struct DeepNested {
    lvl1: Int;
    lvl2: Level2;
}

struct Level2 {
    innerVal: Int;
    lvl3: Level3;
}

struct Level3 {
    z: Int;
    message: Msg;
}

message(0x42) Msg {
    mval: Int;
} 

contract DeepContract {
    store: DeepNested;
    
    init() {
        self.store = DeepNested {
            lvl1: 1,
            lvl2: Level2 {
                innerVal: 2,
                lvl3: Level3 {
                    z: 3, 
                    message: Msg { mval: 4 }
                }
            }
        };
    }
}
