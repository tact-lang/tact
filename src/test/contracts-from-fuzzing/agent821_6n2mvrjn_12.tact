struct LevelA {
    x: Int;
    y: Bool;
}

struct LevelB {
    a: LevelA;
    optA: LevelA?;
}

struct LevelC {
    b: LevelB;
    optB: LevelB?;
}

contract Test3Levels {
    data: LevelC;

    init() {
        self.data = LevelC{
            b: LevelB{a: LevelA{x:1,y:true}, optA:null},
            optB: null,
        };
    }
}