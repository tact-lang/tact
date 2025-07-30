struct LevelA {
    intVal: Int;
    boolVal: Bool;
}

struct LevelB {
    a1: LevelA;
    a2: LevelA;
}

struct LevelC {
    b1: LevelB;
    b2: LevelB;
}

contract NestedMulti {
    root: LevelC;
    init() {
        self.root = LevelC{
            b1: LevelB{
                a1: LevelA{intVal:1,boolVal:true},
                a2: LevelA{intVal:2,boolVal:false}
            },
            b2: LevelB{
                a1: LevelA{intVal:3,boolVal:true},
                a2: LevelA{intVal:4,boolVal:false}
            }
        };
    }
}