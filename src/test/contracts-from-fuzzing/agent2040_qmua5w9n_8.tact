struct InnerMost {
    innerVal: String;
    flag: Bool;
    count: Int;
}

struct LevelTwo {
    x: Int;
    y: Bool;
    z: String;
    nested: InnerMost;
}

struct LevelOne {
    p: Int;
    q: Bool;
    nested: LevelTwo;
}

contract TripleNest {
    storageVar: LevelOne;

    init() {
        self.storageVar = LevelOne{
            p:1,
            q:true,
            nested: LevelTwo{
                x:2, y:false, z:"hello",
                nested: InnerMost { innerVal:"world", flag:true, count:42 }
            }
        };
    }
}
