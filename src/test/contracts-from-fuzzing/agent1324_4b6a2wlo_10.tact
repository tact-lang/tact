struct LevelA {
    valueA: Int;
}

struct LevelB {
    levelA: LevelA;
    valueB: Bool;
}

struct LevelC {
    levelB: LevelB;
    valueC: String;
}

contract DeepStack {
    nestedData: LevelC;
    init() {
        self.nestedData = LevelC{
            levelB: LevelB{
                levelA: LevelA{valueA:100},
                valueB:false
            },
            valueC:"deep"
        };
    }
}