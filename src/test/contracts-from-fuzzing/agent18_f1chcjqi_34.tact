struct Deeply {
    a: LevelA;
}

struct LevelA {
    b: LevelB;
    c: LevelC;
}

struct LevelB {
    x: Int;
}

struct LevelC {
    y: Bool;
}

contract DeeplyNested {
    data: Deeply;
    init() {
        self.data = Deeply{
            a: LevelA{
                b: LevelB{x:10},
                c: LevelC{y:true}
            }
        };
    }
}